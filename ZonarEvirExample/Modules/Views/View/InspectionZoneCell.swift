//
//  InspectionComponentCell.swift
//  ZonarEvirExample
//
//  Created by gcshcm on 22/02/2022.
//

import UIKit

class InspectionComponentCell: UITableViewCell {
    var inspectedZone: InspectedZone!
    @IBOutlet weak var zoneNameLabel: UILabel!
    
    @IBOutlet weak var imageDefectType: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func updateUI(){
        zoneNameLabel.text = inspectedZone.name
        let defectTypeInt = DefectTypeInt(rawValue: Int(inspectedZone.severity))
        switch defectTypeInt {
            case .minor:
            imageDefectType.image = UIImage(named: "ic_defect_minor.png")
            case .major:
            imageDefectType.image = UIImage(named: "ic_defect_major.png")
            default:
            imageDefectType.image = UIImage(named: "ic_defect_none.png")
        }
    }

}
