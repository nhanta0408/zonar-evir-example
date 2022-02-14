//
//  AssetCardCell.swift
//  ZonarEvirExample
//
//  Created by gcshcm on 11/02/2022.
//

import UIKit

class AssetCardCell: UITableViewCell {
    @IBOutlet weak var lineView: UIView!
    var lastInpsectionHomeView = UIView()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        // Assign width of subview = width of cell but something does not be consistent
        lastInpsectionHomeView = LastInspectionHomeView(frame: CGRect(x: 60, y: 200, width: self.frame.width, height: 50))
        contentView.addSubview(lastInpsectionHomeView)
    }


}
