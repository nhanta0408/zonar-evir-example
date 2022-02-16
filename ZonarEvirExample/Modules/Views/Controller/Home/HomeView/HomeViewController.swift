//
//  File.swift
//  ZonarEvirExample
//
//  Created by gcshcm on 11/02/2022.
//

import Foundation
import UIKit

class HomeViewController:UIViewController {
    let numberOfRowTest = 2
    @IBOutlet weak var assetCardTableView: UITableView!
    lazy var customNavigation: NavigationBarCustom = {
        let customNavigation = NavigationBarCustom()
        customNavigation.delegate = self
        return customNavigation
    }()
    override func viewDidLoad() {
        assetCardTableView.dataSource = self
        setupUI()
        //Thêm constraint của right icon here
        // Dùng delegate hoặc closure
    }
    

}
extension HomeViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRowTest
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row == numberOfRowTest-1){
            let cell = assetCardTableView.dequeueReusableCell(withIdentifier: "SelectMethodCell", for: indexPath) as! SelectMethodCell
            return cell
        }
        else {
            let cell = assetCardTableView.dequeueReusableCell(withIdentifier: "AssetCardCell", for: indexPath) as! AssetCardCell
            cell.lastInpsectionHomeView.addRightIconImageView()
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
