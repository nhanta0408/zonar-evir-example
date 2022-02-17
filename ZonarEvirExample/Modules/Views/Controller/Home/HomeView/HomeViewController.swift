//
//  File.swift
//  ZonarEvirExample
//
//  Created by gcshcm on 11/02/2022.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    var assets: [Asset]!
    var configs: [Config]!
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
    }
    

}
extension HomeViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numberOfAssetRow = homeVM.getCountOfAllAssets()+1
        print("number of asset: \(numberOfAssetRow)")
        return numberOfAssetRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row == numberOfAssetRow-1){
            let cell = assetCardTableView.dequeueReusableCell(withIdentifier: "SelectMethodCell", for: indexPath) as! SelectMethodCell
            return cell
        }
        else {
            let cell = assetCardTableView.dequeueReusableCell(withIdentifier: "AssetCardCell", for: indexPath) as! AssetCardCell
            cell.asset = assets[indexPath.row]
            cell.config = configs[indexPath.row]
            cell.updateUI()
            cell.closureTap = {
                let vc = LastInspectionViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }
            return cell
        }
    }
}

//Setup code block
extension HomeViewController {
    private func setupUI(){
        // TODO: Bug
        //Add NavBar make the ADD ASSET BUTTON disappear
        setupNavigationItems()
        if #available(iOS 15, *) {
            // TODO: Bug
            assetCardTableView.sectionHeaderTopPadding = 0 // does not be fixed
        }
    }
}

//Refactor code
extension HomeViewController {
    private func setupNavigationItems() {
        customNavigation.setupNavColor()
        customNavigation.setupLeftNavItems(text: "Hello Test Hard code")
        customNavigation.setupRightnavItems()
        customNavigation.setupHeaderBar(headerBarLbl: "Division hard code")
        customNavigation.setupCenterNavItems(title: "")
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
}
