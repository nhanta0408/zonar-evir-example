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
    
    override func viewDidLoad() {
        assetCardTableView.dataSource = self
    }

}
extension HomeViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = assetCardTableView.dequeueReusableCell(withIdentifier: "AssetCardCell", for: indexPath)
        return cell
    }
}
