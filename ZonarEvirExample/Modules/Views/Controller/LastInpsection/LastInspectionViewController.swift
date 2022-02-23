//
//  LastInspectionViewController.swift
//  ZonarEvirExample
//
//  Created by gcshcm on 17/02/2022.
//

import UIKit

class LastInspectionViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var lastInspectionViewModel = LastInspectionViewModel()
    
    var numberOfRow = 9; //Default value for testing
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Last Inspection Screen"
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        numberOfRow = lastInspectionViewModel.currentLastInspectedAsset.inspectedZones.count + 2 // plus 2 because of Information and Knowledge cell
    }
}
extension LastInspectionViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRow
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "InspectionInformationCell", for: indexPath) as! InspectionInformationCell
            cell.currentLastInspection = lastInspectionViewModel.currentLastInspectedAsset
            cell.setupUI()
            return cell
        }
        else if indexPath.row == numberOfRow - 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PastInspectionAcknowledgeCell", for: indexPath) as! PastInspectionAcknowledgeCell
            cell.currentInspectedAsset = lastInspectionViewModel.currentLastInspectedAsset
            cell.updateUI()
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "InspectionComponentCell", for: indexPath) as! InspectionComponentCell
            cell.inspectedZone = lastInspectionViewModel.currentLastInspectedAsset.inspectedZones[indexPath.row-1]
            cell.updateUI()
            return cell
        }
       
    }
}
