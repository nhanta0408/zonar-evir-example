//
//  LastInspectionHomeView.swift
//  ZonarEvirExample
//
//  Created by gcshcm on 14/02/2022.
//

import UIKit

class LastInspectionHomeView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var labelLastInspection: UILabel = UILabel()
    var labelDateAndInspector: UILabel = UILabel()
    var labelInspectionTypeAndResult: UILabel = UILabel()
    var rightIcon: UIImageView = UIImageView(frame: CGRect(x: 100, y: 0, width: 30, height: 30))
    var trashIconButton = UIButton()
    var config: Config!
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .white
    }

    private func addLabelLastInspectionView(string : String) {
        labelLastInspection.textAlignment = NSTextAlignment.left
        labelLastInspection.text = string
        labelLastInspection.font = UIFont.boldSystemFont(ofSize: 18.0)
        labelLastInspection.textColor = .black
        labelLastInspection.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelLastInspection)
    }
    private func addLabelDateAndInspector(dateString : String, inspectorString: String) {
        labelDateAndInspector.textAlignment = NSTextAlignment.left
        labelDateAndInspector.text = dateString + " day ago by " + inspectorString
        labelDateAndInspector.font = UIFont.systemFont(ofSize: 14)
        labelDateAndInspector.textColor = .gray
        labelDateAndInspector.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelDateAndInspector)

    }
    private func addLabelInspectionTypeAndResult(inspectionTypeString: String, typeOfDefect: String) {
        labelInspectionTypeAndResult.textAlignment = NSTextAlignment.left
        labelInspectionTypeAndResult.text = inspectionTypeString + " - " + typeOfDefect + " defect reported."
        labelInspectionTypeAndResult.font = UIFont.systemFont(ofSize: 14)
        labelInspectionTypeAndResult.textColor = .gray
        labelInspectionTypeAndResult.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelInspectionTypeAndResult)
    }
    func addRightIconImageView(){
        rightIcon.image = UIImage(named: "right")
        rightIcon.translatesAutoresizingMaskIntoConstraints = false
        rightIcon.contentMode = .scaleAspectFit
        self.addSubview(rightIcon)

        rightIcon.leadingAnchor.constraint(equalTo: trashIconButton.leadingAnchor).isActive = true
        rightIcon.widthAnchor.constraint(equalToConstant: 20).isActive = true
        rightIcon.heightAnchor.constraint(equalToConstant: 40).isActive = true
        rightIcon.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
    }
    func updateUI(){
        self.addLabelLastInspectionView(string: "LAST INSPECTION")
        self.addLabelDateAndInspector(dateString: String(config.lastInspectionDayBefore), inspectorString: config.inspectorName?.fullName ?? "")
        self.addLabelInspectionTypeAndResult(inspectionTypeString:
                                                config.inspectionType ?? "", typeOfDefect: config.defectType ?? "")
        
        self.addRightIconImageView()
        NSLayoutConstraint.activate([
            labelLastInspection.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            labelLastInspection.topAnchor.constraint(equalTo: self.topAnchor),
            labelLastInspection.widthAnchor.constraint(equalToConstant: 200),
            labelLastInspection.heightAnchor.constraint(equalToConstant: 20),
            
            labelDateAndInspector.topAnchor.constraint(equalTo: labelLastInspection.bottomAnchor, constant: 5),
            labelDateAndInspector.leadingAnchor.constraint(equalTo: labelLastInspection.leadingAnchor),
            labelDateAndInspector.widthAnchor.constraint(equalToConstant: 300),
            labelDateAndInspector.heightAnchor.constraint(equalToConstant: 20),
            
            labelInspectionTypeAndResult.topAnchor.constraint(equalTo: labelDateAndInspector.bottomAnchor, constant: 5),
            labelInspectionTypeAndResult.leadingAnchor.constraint(equalTo: labelLastInspection.leadingAnchor),
            labelInspectionTypeAndResult.widthAnchor.constraint(equalToConstant: 300),
            labelInspectionTypeAndResult.heightAnchor.constraint(equalToConstant: 20),
 
         
        ])
    }
    
}

