//
//  AssetCardCell.swift
//  ZonarEvirExample
//
//  Created by gcshcm on 11/02/2022.
//

import UIKit

class AssetCardCell: UITableViewCell {
    var asset: Asset!
    var config: Config!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var readyLbl: UILabel!
    @IBOutlet weak var readyBackground: UIView!
    @IBOutlet weak var trashIconButton: UIButton!
    @IBOutlet weak var assetTypeLabel: UILabel!
    @IBOutlet weak var assetNumberLabel: UILabel!
    @IBOutlet weak var manufactureLabel: UILabel!
    @IBOutlet weak var vinValueLabel: UILabel!
    @IBOutlet weak var dotValueLabel: UILabel!
    @IBOutlet weak var plateValueLabel: UILabel!
    @IBOutlet weak var rentalDotValueLabel: UILabel!
    
    var lastInpsectionHomeView = LastInspectionHomeView()

    typealias ClosureVoid = () -> ()
    var closureTap: ClosureVoid!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    private func setupUI(){
        lastInpsectionHomeView = LastInspectionHomeView(frame: CGRect(x: 60, y: 200, width: self.frame.width, height: 50))
        lastInpsectionHomeView.trashIconButton = trashIconButton
        contentView.addSubview(lastInpsectionHomeView)
        readyLbl.transform =  CGAffineTransform(rotationAngle: CGFloat.pi / 2)
        readyLbl.textAlignment = NSTextAlignment.left
      
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        lastInpsectionHomeView.addGestureRecognizer(tap)
    }
    private func updateReadyLbl(){
        if config.defectType != DefectType.noDefect.rawValue {
            //Temporarily using Continental Red
            readyBackground.backgroundColor = .continentalLightRed
            readyLbl.text = "NOT READY"
        }
        else {
            readyBackground.backgroundColor = .continentalLightGreen
            readyLbl.text = "READY"
        
        }
    }
    func updateUI(){
        assetTypeLabel.text = config.assetType
        assetNumberLabel.text = asset.assetName
        vinValueLabel.text = asset.vin
        plateValueLabel.text = asset.plate
        dotValueLabel.text = String(asset.dot)
        
        updateReadyLbl()
        
        lastInpsectionHomeView.config = config
        lastInpsectionHomeView.updateUI()
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        closureTap()
    }

}
