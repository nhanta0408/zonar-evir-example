//
//  EvirTheme.swift
//  ZonarEvirExample
//
//  Created by gcshcm on 14/02/2022.
//

import UIKit

class EvirTheme: ThemeProtocol {
//    var headingFont: String = Fonts.robotoMedium
//    var subtitleFont: String = Fonts.robotoRegular
//    var boldFont: String = Fonts.robotoBold
    
    var primaryColor: UIColor = .customBlue
    var navigationBarColor: UIColor = .navigationBarDarkBlue
    var backgroundColor: UIColor = .customLightGray
    var textColor: UIColor = .black
    var titlePrimaryButtonColor: UIColor = .white
    var titleSecondaryButtonColor: UIColor = .customBlue
    
    var segmentSelectedBackgroundColor: UIColor = .white
    var segmentUnselectedBackgroundColor: UIColor = .customBlue
    var segmentSelectedTextColor: UIColor = .customBlue
    var segmentUnselectedTextColor: UIColor = .white
    var homeCardReadyColor: UIColor = .homeCardReady
    var homeCardNotReadyColor: UIColor = .homeCardNotReady
    var readyStringColor: UIColor = .white
    
    var measurementTypeSelectBackground: UIColor = .customBlue
    var measurementTypeUnselectBackground: UIColor = .white
    var measurementTypeSelectTextColor: UIColor = .white
    var measurementTypeUnselectTextColor: UIColor = .customBlue
    
    var inspectionDetailHeaderColor: UIColor = .inspectionDetailGray
    var inspectionDetailBackgroundColor: UIColor = .customLightGray
    
    // Defect screen
    var defectButtonBackground: UIColor = .buttonLightBlue
    var defectButtonTitleColor: UIColor = .titleButtonDefectDarkBlue
//    var selectedDot: UIImage = .radioButtonSelected ?? UIImage()
//    var unselectedDot: UIImage = .radioButtonNotSelected ?? UIImage()
    var defectControllerBackgroundColor: UIColor = .white
}

