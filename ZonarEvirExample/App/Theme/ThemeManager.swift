//
//  ThemeManager.swift
//  ZonarEvirExample
//
//  Created by gcshcm on 14/02/2022.
//

import UIKit

protocol ThemeProtocol {
    // Core element
//    var headingFont: String { get }
//    var subtitleFont: String { get }
//    var boldFont: String { get }
    
    var primaryColor: UIColor { get }
    var navigationBarColor: UIColor { get }
    var backgroundColor: UIColor { get }
    var textColor: UIColor { get }
    var titlePrimaryButtonColor: UIColor { get }
    var titleSecondaryButtonColor: UIColor { get }
    
    // Home card
    var homeCardReadyColor: UIColor { get }
    var homeCardNotReadyColor: UIColor { get }
    var readyStringColor: UIColor { get }
    
    // Map view, list view page
    var segmentSelectedBackgroundColor: UIColor { get }
    var segmentUnselectedBackgroundColor: UIColor { get }
    var segmentSelectedTextColor: UIColor { get }
    var segmentUnselectedTextColor: UIColor { get }
    // Inpsection Detail page
    var measurementTypeSelectBackground: UIColor { get }
    var measurementTypeUnselectBackground: UIColor { get }
    var measurementTypeSelectTextColor: UIColor { get }
    var measurementTypeUnselectTextColor: UIColor { get }
    
    // Inspection Detail expandable
    var inspectionDetailHeaderColor: UIColor { get }
    var inspectionDetailBackgroundColor: UIColor { get }
    
    // Defect screen
    var defectButtonBackground: UIColor { get }
    var defectButtonTitleColor: UIColor { get }
//    var selectedDot: UIImage { get }
//    var unselectedDot: UIImage { get }
    var defectControllerBackgroundColor: UIColor { get }
}

class ThemeManager {
    static var current: ThemeProtocol = EvirTheme()
}
