//
//  UIView+Extensions.swift
//  ZonarEvirExample
//
//  Created by gcshcm on 14/02/2022.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    // MARK: - General
    static let customBlue = UIColor.rgb(red: 22, green: 70, blue: 155)
    static let customYellow = UIColor.rgb(red: 255, green: 201, blue: 38)
    static let customLightGray = UIColor.rgb(red: 243, green: 244, blue: 245)
    static let customGray = UIColor.rgb(red: 222, green: 222, blue: 222)
    static let headingPrimaryColor = UIColor.rgb(red: 73, green: 85, blue: 94)
    static let headingSecondaryColor = UIColor.rgb(red: 91, green: 103, blue: 112)
    static let backgroundDisableGray = UIColor.rgb(red: 226, green: 228, blue: 230)
    static let navigationBarDarkBlue = UIColor.rgb(red: 0, green: 32, blue: 108)
    static let inspectionDetailGray = UIColor.rgb(red: 249, green: 249, blue: 250)
    
    // MARK: - Label & Textfield
    static let customTextGrayColor = UIColor.rgb(red: 155, green: 155, blue: 155)
    static let textDisableGray = UIColor.rgb(red: 140, green: 140, blue: 140)
    static let customTextBlueColor = UIColor.rgb(red: 0, green: 53, blue: 141)
    
    // MARK: - Button
    static let buttonDisableGray = UIColor.rgb(red: 226, green: 228, blue: 230)
    static let buttonLightBlue = UIColor.rgb(red: 211, green: 219, blue: 232)
    static let buttonLightGray = UIColor.rgb(red: 222, green: 222, blue: 222)
    static let buttonSlate = UIColor.rgb(red: 162, green: 160, blue: 175)
    static let titleButtonDefectDarkBlue = UIColor.rgb(red: 4, green: 53, blue: 128)
    static let titleLabelDarkBlue = UIColor.rgb(red: 0, green: 53, blue: 128)
    static let buttonMinorDefectYellow = UIColor.rgb(red: 245, green: 166, blue: 35)
    static let buttonMajorDefectRed = UIColor.rgb(red: 211, green: 31, blue: 7)
    static let titleButtonOfActionSheet = UIColor.rgb(red: 132, green: 132, blue: 132)
    static let coldGray = UIColor.rgb(red: 232, green: 233, blue: 235)
    
    // MARK: - UI Switch
    static let switchOnTintColor = UIColor.rgb(red: 208, green: 208, blue: 208)
    static let switchOffTintColor = UIColor.rgb(red: 208, green: 208, blue: 208)
    static let switchThumbOffTintColor = UIColor.rgb(red: 119, green: 119, blue: 119)
    
    //Evir color:
    static let homeCardReady = UIColor(hexString: "#7EA500")
    static let homeCardNotReady = UIColor.red
    
    // Continental color:
    static let continentalLightRed = UIColor(hexString: "#FF2D37")
    static let continentalYellow = UIColor(hexString: "#FFA500")
    static let continentalLightGreen = UIColor(hexString: "#2DB928")
    static let continentalDarkGray = UIColor(hexString: "#303030")
    static let continentalGray1 = UIColor(hexString: "#454545")
    static let continentalGray2 = UIColor(hexString: "#6B6B6B")
    static let continentalGray3 = UIColor(hexString: "#969696")
    static let continentalGray5 = UIColor(hexString: "#CDCDCD")
    static let continentalGray6 = UIColor(hexString: "#F0F0F0")
    static let continentalGray7 = UIColor(hexString: "#454545")
    
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
            case 3: // RGB (12-bit)
                (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            case 6: // RGB (24-bit)
                (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            case 8: // ARGB (32-bit)
                (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            default:
                (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

