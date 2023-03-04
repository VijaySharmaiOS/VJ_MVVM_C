//
//  MyProjectsViewController.swift
//  VJ_MVVM
//
//  Created by Vijay on 26/02/23.
//

import UIKit

class MyProjectsViewController: ViewController<MyProjectViewModel> {

    var arrProjectType = ["All Projects","Draft Projects","Ongoing Projects","Completed Projects"]
    var projectType = DropDown()
    
    @IBOutlet weak var MyProjectCollectionView: UICollectionView!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var allProjectDropDownButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.myprojectDelegate = self
        MyProjectCollectionView.registerNIB(cellName: "MyProjectCollectionViewCell")
        setupFilter()
    }

    @IBAction func onClickBack(_ sender: Any) {
        viewModel.onClickBack()
    }
    
    @IBAction func onClickAllProjectButton(_ sender: Any) {
        projectType.show()
    }
    
}

extension MyProjectsViewController : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = MyProjectCollectionView.dequeueReusableCell(withReuseIdentifier: "MyProjectCollectionViewCell", for: indexPath) as! MyProjectCollectionViewCell
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.coordinator?.navToSkuScreen()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: MyProjectCollectionView.frame.width/2 - 10, height: 185)
    }
    
}

extension MyProjectsViewController{
    func setupFilter() {
        self.projectType.anchorView = allProjectDropDownButton
        self.projectType.cornerRadius = 10
        self.projectType.width = 180//categoryselectButton.frame.size.width - 130
        self.projectType.shadowOffset = CGSize(width: -1, height: 1)
        self.projectType.bottomOffset = CGPoint(x:60, y: allProjectDropDownButton.bounds.origin.y + 45)
        self.projectType.shadowColor = UIColor.appColor
        self.projectType.shadowRadius = 3
        self.projectType.shadowOpacity = 1
        self.projectType.dataSource = arrProjectType
        self.projectType.borderColor = UIColor.appColor
        self.projectType.borderWidth = 1
        self.projectType.selectionAction = { [weak self] (index, item) in
            self?.headerLabel.text = item
        }
    }
}

extension MyProjectsViewController : MyprojectPresenterProtocol{
    func didgetMyProjectsData(message: String) {
        
    }
    
    func didFailtogetMyprojectData(message: String) {
        
    }
}
