//
//  File.swift
//  ZonarEvirExample
//
//  Created by gcshcm on 11/02/2022.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    var assets: [AssetDetail]!
    var configs: [ConfigDetail]!
    var numberOfAssetRow: Int = 0
    @IBOutlet weak var assetCardTableView: UITableView!
    lazy var customNavigation: NavigationBarCustom = {
        let customNavigation = NavigationBarCustom()
        customNavigation.delegate = self
        return customNavigation
    }()
    var homeVM = HomeViewModel()
    
    override func viewDidLoad() {
        assetCardTableView.dataSource = self
        assetCardTableView.allowsSelection = false
        setupUI()
        //Thêm constraint của right icon here
        // Dùng delegate hoặc closure
        //Use for staging
        homeVM.createTestInstanceCoreData()
        assets = homeVM.getAllAssets()
        configs = homeVM.getAllConfigs()
        //Footer
        let footerView = UIView()
        footerView.backgroundColor = .white
        footerView.frame.size.height = 100
        assetCardTableView.tableFooterView = footerView
        
    }


}
extension HomeViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfAsset = homeVM.getCountOfAllAssetDetails()
        if(numberOfAsset==0)
        {
            numberOfAssetRow = 2 //2 to show the NoAssetCell, Select method cell
        }
        else {
            numberOfAssetRow = numberOfAsset + 1 //plus 1 to show the Select method cell
        }
        print("number of asset: \(numberOfAssetRow)")
        return numberOfAssetRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row == numberOfAssetRow-1){
            let cell = assetCardTableView.dequeueReusableCell(withIdentifier: "SelectMethodCell", for: indexPath) as! SelectMethodCell
            return cell
        }
        else {
            if(homeVM.getCountOfAllAssetDetails() == 0){
                assetCardTableView.register(UINib(nibName: "NoAssetCell", bundle: nil), forCellReuseIdentifier: "NoAssetCell")
                let cell = tableView.dequeueReusableCell(withIdentifier: "NoAssetCell") as! NoAssetCell
                return cell
            }
            else{
                let cell = assetCardTableView.dequeueReusableCell(withIdentifier: "AssetCardCell", for: indexPath) as! AssetCardCell
                cell.asset = assets[indexPath.row]
                cell.config = configs[indexPath.row]
                cell.updateUI()
                cell.closureTap = {
                    let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "LastInspectionViewController")
                    self.navigationController?.pushViewController(vc, animated: true)
                }
                return cell
            }
        }
    }
}

//Setup code block
extension HomeViewController {
    private func setupUI(){
        setupNavigationItems()
        if #available(iOS 15, *) {
            assetCardTableView.sectionHeaderTopPadding = 0
        }
    }
}

//Refactor code
extension HomeViewController {
    private func setupNavigationItems() {
        customNavigation.setupNavColor()
        customNavigation.setupLeftNavItems(text: homeVM.helloMessage)
        customNavigation.setupRightnavItems()
        customNavigation.setupHeaderBar(headerBarLbl: "Division hard code")
        customNavigation.setupCenterNavItems(title: "")
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
}
