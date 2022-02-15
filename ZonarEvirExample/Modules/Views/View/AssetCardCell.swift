//
//  AssetCardCell.swift
//  ZonarEvirExample
//
//  Created by gcshcm on 11/02/2022.
//

import UIKit

class AssetCardCell: UITableViewCell {
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var readyLbl: UILabel!
    @IBOutlet weak var trashIconButton: UIButton!
    var lastInpsectionHomeView = LastInspectionHomeView()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configUI()
    }
    private func configUI(){
        lastInpsectionHomeView = LastInspectionHomeView(frame: CGRect(x: 60, y: 200, width: self.frame.width, height: 50))
        lastInpsectionHomeView.trashIconButton = trashIconButton
        contentView.addSubview(lastInpsectionHomeView)
        readyLbl.transform =  CGAffineTransform(rotationAngle: CGFloat.pi / 2)
        readyLbl.textAlignment = NSTextAlignment.left
    }


}
