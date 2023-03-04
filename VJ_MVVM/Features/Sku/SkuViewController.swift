//
//  SkuViewController.swift
//  VJ_MVVM
//
//  Created by Vijay on 01/03/23.
//

import UIKit

class SkuViewController: ViewController<SkuViewModel> {

    @IBOutlet weak var skuCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.skuDelegate = self
        skuCollectionView.registerNIB(cellName: "MyProjectCollectionViewCell")
    }
    
    @IBAction func onClickBackButton(_ sender: Any) {
        viewModel.onClickBack()
    }
    
}

extension SkuViewController : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = skuCollectionView.dequeueReusableCell(withReuseIdentifier: "MyProjectCollectionViewCell", for: indexPath) as! MyProjectCollectionViewCell
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: skuCollectionView.frame.width/2 - 10, height: 185)
    }
    
}

extension SkuViewController : skuPresenterProtocol{
    func didGetAllSku() {
        
    }
    
    func didFailToGetSku() {
     
    }
    
    
}
