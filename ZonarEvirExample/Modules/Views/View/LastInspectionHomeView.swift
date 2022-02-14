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

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addLabelLastInspectionView(string: "LAST INSPECTION")
        self.addLabelDateAndInspector(dateString: "1", inspectorString: "Nhan Huu Ta")
        self.addLabelInspectionTypeAndResult(inspectionTypeString: InspectionType.preTrip.rawValue, typeOfDefect: TypeOfDefect.majorDefect.rawValue)
        NSLayoutConstraint.activate([
            labelLastInspection.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            labelLastInspection.topAnchor.constraint(equalTo: self.topAnchor),
            labelDateAndInspector.topAnchor.constraint(equalTo: labelLastInspection.bottomAnchor, constant: 5),
            labelDateAndInspector.leadingAnchor.constraint(equalTo: labelLastInspection.leadingAnchor),
            labelInspectionTypeAndResult.topAnchor.constraint(equalTo: labelDateAndInspector.bottomAnchor, constant: 5),
            labelInspectionTypeAndResult.leadingAnchor.constraint(equalTo: labelLastInspection.leadingAnchor)
        ])
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .white
    }

    func addLabelLastInspectionView(string : String) {
        labelLastInspection.textAlignment = NSTextAlignment.left
        labelLastInspection.text = string
        labelLastInspection.font = UIFont.boldSystemFont(ofSize: 18.0)
        labelLastInspection.textColor = .black
        labelLastInspection.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelLastInspection)
//        labelLastInspection.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//        labelLastInspection.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    func addLabelDateAndInspector(dateString : String, inspectorString: String) {
        self.addSubview(labelDateAndInspector)
        labelDateAndInspector.textAlignment = NSTextAlignment.left
        labelDateAndInspector.text = dateString + " day ago by " + inspectorString
        labelDateAndInspector.font = UIFont.systemFont(ofSize: 14)
        labelDateAndInspector.textColor = .gray
        labelDateAndInspector.translatesAutoresizingMaskIntoConstraints = false
//        labelLastInspection.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//        labelLastInspection.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    func addLabelInspectionTypeAndResult(inspectionTypeString: String, typeOfDefect: String) {
        self.addSubview(labelInspectionTypeAndResult)
        labelInspectionTypeAndResult.textAlignment = NSTextAlignment.left
        labelInspectionTypeAndResult.text = inspectionTypeString + " - " + typeOfDefect + " defect reported."
        labelInspectionTypeAndResult.font = UIFont.systemFont(ofSize: 14)
        labelInspectionTypeAndResult.textColor = .gray
        labelInspectionTypeAndResult.translatesAutoresizingMaskIntoConstraints = false
    }
    
  
    
}

