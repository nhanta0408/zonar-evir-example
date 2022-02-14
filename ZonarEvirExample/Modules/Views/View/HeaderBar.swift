//
//  Header.swift
//  ZonarEvirExample
//
//  Created by gcshcm on 14/02/2022.
//

import UIKit

class HeaderBar: UIView {
    
    let headerLbl: UILabel = {
       let label = UILabel()
        label.text = "mbl2020"
        label.textColor = UIColor(displayP3Red: 255, green: 255, blue: 255, alpha: 0.8)
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = ThemeManager.current.navigationBarColor
        addSubview(headerLbl)
        addConstraintsWithFormat(format: "H:|-20-[v0]", views: headerLbl)
        addConstraintsWithFormat(format: "V:|-(-15)-[v0]|", views: headerLbl)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
