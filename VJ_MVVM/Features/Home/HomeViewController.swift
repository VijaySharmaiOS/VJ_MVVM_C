//
//  HomeViewController.swift
//  VJ_MVVM
//
//  Created by Vijay on 23/02/23.
//

import UIKit

class HomeViewController: ViewController<HomeViewModel> {
   
    var arrCategory = ["Automobiles","E-commerce","Food & Beverages","Footwear"]
    var category = DropDown()
    var ischeck : Bool = false
    
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var CategoryCollectionView: UICollectionView!
    @IBOutlet weak var adsCollectionView: UICollectionView!
    @IBOutlet weak var projectCollectionView: UICollectionView!
    @IBOutlet weak var categoryselectButton: UIButton!
    @IBOutlet weak var SelectShootOptionView: UIView!
    @IBOutlet weak var transparnetView: UIView!
    @IBOutlet weak var plusButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.homedelegate = self
        initalSetup()
    }
    
    func initalSetup(){
        SelectShootOptionView.isHidden = true
        transparnetView.isHidden = true
        CategoryCollectionView.registerNIB(cellName: "CategoryCollectionViewCell")
        adsCollectionView.registerNIB(cellName: "AdsCollectionViewCell")
        projectCollectionView.registerNIB(cellName: "ProjectsCollectionViewCell")
        setupFilter()
     }
    
    @IBAction func onClickSelectCategory(_ sender: Any) {
        category.show()
    }
    
    @IBAction func onClickViewAll(_ sender: Any) {
        viewModel.onClickViewAll()
    }
    
    @IBAction func onClickAddButton(_ sender: Any) {
        if (ischeck == true){
            transparnetView.isHidden = true
            SelectShootOptionView.isHidden = true
            ischeck = false
        }else{
            transparnetView.isHidden = false
            SelectShootOptionView.isHidden = false
            ischeck = true
        }
    }
    
    @IBAction func onClickHideTransparnetViewButton(_ sender: Any) {
        ischeck = false
        transparnetView.isHidden = true
        SelectShootOptionView.isHidden = true
    }
    
    
    
    func loadWallet() {
        let wallet = WalletView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        self.view.addSubview(wallet)
        
    }
}

extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == CategoryCollectionView{
            return 10
        }else if collectionView == adsCollectionView{
            return 1
        }else{
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == CategoryCollectionView{
            guard let categoryCell = CategoryCollectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as? CategoryCollectionViewCell else { return UICollectionViewCell() }
            return categoryCell
        }else if collectionView == adsCollectionView{
            let cell = adsCollectionView.dequeueReusableCell(withReuseIdentifier: "AdsCollectionViewCell", for: indexPath) as! AdsCollectionViewCell
            return cell
        }else{
            let cell = projectCollectionView.dequeueReusableCell(withReuseIdentifier: "ProjectsCollectionViewCell", for: indexPath) as! ProjectsCollectionViewCell
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == projectCollectionView{
            viewModel.coordinator?.navToskuScreen()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == CategoryCollectionView{
            return CGSize(width: CategoryCollectionView.frame.width/3, height: 100)
        }else if collectionView == adsCollectionView{
            return CGSize(width: adsCollectionView.frame.width, height: 135)
        }else{
            return CGSize(width: projectCollectionView.frame.width/2 - 20, height: 170)
        }
    }
    
}

extension HomeViewController{
    func setupFilter() {
        self.category.anchorView = categoryselectButton
        self.category.cornerRadius = 10
        self.category.width = 160//categoryselectButton.frame.size.width - 130
        self.category.shadowOffset = CGSize(width: -1, height: 1)
        self.category.bottomOffset = CGPoint(x:10, y: categoryselectButton.bounds.origin.y + 45)
        self.category.shadowColor = UIColor.appColor
        self.category.shadowRadius = 3
        self.category.shadowOpacity = 1
        self.category.dataSource = arrCategory
        self.category.borderColor = UIColor.appColor
        self.category.borderWidth = 1
        self.category.selectionAction = { [weak self] (index, item) in
            self?.categoryNameLabel.text = item
        }
    }
}


extension HomeViewController : HomePresenterProtocol{
    
    func didgetHomeData() {
        
    }
    
    func didFailTogetHomeData() {
        
    }
}
