//
//  NetworkRouter.swift
//  VJ_MVVM
//
//  Created by Vijay on 27/02/23.
//

import Foundation

protocol ServiceNetworkRouter: AnyObject {
//    associatedtype EndPoint: EndPointType
    func performDataTask<T: Decodable>(_ route: NetworkRoute, completionHandler: @escaping(Result<T, NetworkingError>) -> Void)
    func cancel()
}

public class ServiceRouter: ServiceNetworkRouter {
    
    public var isLoggingEnable: Bool = false
    private var queue = DispatchQueue(label: "RVNetworkQueue",qos: .background,attributes: .concurrent)
    public init(){}
    private var task: URLSessionTask?
    
    public func performDataTask<T: Decodable>(_ route: NetworkRoute, completionHandler: @escaping(Result<T, NetworkingError>) -> Void) {
//        queue.async {
            do {
                let urlRequest = try self.buildRequest(from: route)
                
                if self.isLoggingEnable {
                    NetworkLogger.log(request: urlRequest)
                }
                
                self.task =  URLSession.shared.dataTask(with: urlRequest) { responseData, urlResponse, error in
                    guard error == nil else {
                        completionHandler(.failure(.networkError))
                        return
                    }
                    
                    guard let urlResponse = urlResponse as? HTTPURLResponse, urlResponse.statusCode == 200 else {
                        completionHandler(.failure(.urlResponseError))
                        return
                    }
                    
                    if self.isLoggingEnable {
                        NetworkLogger.log(response: urlResponse)
                    }
                    
                    guard let responseData = responseData , responseData.count > 0 else {
                        completionHandler(.failure(.dataError))
                        return
                    }
                    
                    if self.isLoggingEnable {
                        NetworkLogger.log(response: responseData)
                    }
                    
                    let decoder = JSONDecoder()
                    do {
                        let result = try decoder.decode(T.self, from: responseData)
                        completionHandler(.success(result))
                        
                    } catch {
                        debugPrint("error occured while decoding = \(error.localizedDescription)")
                        completionHandler(.failure(.decodingError))
                    }
                    
                }
            }catch {
                completionHandler(.failure(.networkError))
            }
            self.task?.resume()
//        }
    }
    
    public func cancel() {
        self.task?.cancel()
    }
    
    
    private func buildRequest(from route: NetworkRoute) throws -> URLRequest {
        
        var request = URLRequest(url: route.baseURL.appendingPathComponent(route.path ?? ""),
                                 cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                 timeoutInterval: 180.0)
        
        request.httpMethod = route.httpMethod.rawValue
        do {
            switch route.task {
            case .request:
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            case .requestWithParameters(let bodyParameters,
                                        let bodyEncoding,
                                        let urlParameters):
                
                try self.configureParameters(bodyParameters: bodyParameters,
                                             bodyEncoding: bodyEncoding,
                                             urlParameters: urlParameters,
                                             request: &request)
                
            case .requestParametersAndHeaders(let bodyParameters,
                                              let bodyEncoding,
                                              let urlParameters,
                                              let additionalHeaders):
                
                self.addAdditionalHeaders(additionalHeaders, request: &request)
                try self.configureParameters(bodyParameters: bodyParameters,
                                             bodyEncoding: bodyEncoding,
                                             urlParameters: urlParameters,
                                             request: &request)
            }
            return request
        } catch {
            throw error
        }
    }
    fileprivate func configureParameters(bodyParameters: Parameters?,
                                         bodyEncoding: ParameterEncoding,
                                         urlParameters: Parameters?,
                                         request: inout URLRequest) throws {
        do {
            try bodyEncoding.encode(urlRequest: &request,
                                    bodyParameters: bodyParameters, urlParameters: urlParameters)
        } catch {
            throw error
        }
    }
    fileprivate func addAdditionalHeaders(_ additionalHeaders: HTTPHeaders?, request: inout URLRequest) {
        guard let headers = additionalHeaders else { return }
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
    }
    
}
