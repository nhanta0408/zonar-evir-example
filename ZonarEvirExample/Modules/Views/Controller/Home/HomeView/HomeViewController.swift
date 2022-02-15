//
//  File.swift
//  ZonarEvirExample
//
//  Created by gcshcm on 11/02/2022.
//

import Foundation
import UIKit

class HomeViewController:UIViewController {
    
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = assetCardTableView.dequeueReusableCell(withIdentifier: "AssetCardCell", for: indexPath)
        
        return cell
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
