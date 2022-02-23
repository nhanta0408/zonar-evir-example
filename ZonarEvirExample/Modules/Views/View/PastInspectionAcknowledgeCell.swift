//
//  PastInspectionAcknowledgeCell.swift
//  ZonarEvirExample
//
//  Created by gcshcm on 22/02/2022.
//

import UIKit

class PastInspectionAcknowledgeCell: UITableViewCell {

    @IBOutlet weak var acknowledgeLabel: UILabel!
    var content = "Sample content"
    var inspectionType = "Pre-Trip" //Sample
    var inspector = "Nhan Huu Ta Nhan Huu Ta"   //Sample
    var currentInspectedAsset: InspectedAsset!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func updateUI(){
        inspectionType = currentInspectedAsset.inspectionType
        inspector = currentInspectedAsset.lastReviewedBy
        formatFontWeight()
    }
    private func formatFontWeight(){
        content = "This \(inspectionType) inspection was certified to be true and accurate by \(inspector)"
        acknowledgeLabel.text = content
        let contentLength = content.count
        let inspectorLength = inspector.count
        let amountText = NSMutableAttributedString.init(string: content)

        // set the custom font and color for the 0,1 range in string
        amountText.setAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
                                  NSAttributedString.Key.foregroundColor: UIColor.white],
                                 range: NSMakeRange(0,contentLength - inspectorLength - 1))
        // if you want, you can add more attributes for different ranges calling .setAttributes many times

        // set the attributed string to the UILabel object
        acknowledgeLabel.attributedText = amountText
    }

}
