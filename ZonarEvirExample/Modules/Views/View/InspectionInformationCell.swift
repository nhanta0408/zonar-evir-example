//
//  InspectionInformationCell.swift
//  ZonarEvirExample
//
//  Created by gcshcm on 21/02/2022.
//

import UIKit

class InspectionInformationCell: UITableViewCell {
    var currentLastInspection: InspectedAsset!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var inspectionTypeLabel: UILabel!
    @IBOutlet weak var inspectedByLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var lastReviewedByLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setupUI(){
        inspectionTypeLabel.text = LastInspectedViewString.inspectionType.rawValue + currentLastInspection.inspectionType
        inspectedByLabel.text = LastInspectedViewString.inspectedBy.rawValue + currentLastInspection.inspectedBy
        timestampLabel.text = LastInspectedViewString.timestamp.rawValue + currentLastInspection.timestamp
        durationLabel.text = LastInspectedViewString.duration.rawValue + currentLastInspection.duration
        lastReviewedByLabel.text = LastInspectedViewString.lastReviewedBy.rawValue +  currentLastInspection.lastReviewedBy
    }
}
