//
//  NavigationBarCustom.swift
//  ZonarEvirExample
//
//  Created by gcshcm on 14/02/2022.
//

import UIKit

class NavigationBarCustom {
    private var helloMsg = ""
    private var divisionMsg = ""
    
    var delegate: UIViewController?
    var rightBtn = UIButton()
    var leftBtn = UIButton()
    var imageNameGroup = "menu"
    var imageNameX = "close"
    var imageName = ""
    var flag = true
    var backBtn = UIButton()
    
    func setupNavColor() {
        // https://developer.apple.com/forums/thread/682420 - iOS 15 black navigation bar issue
        let navigationBar = delegate?.navigationController?.navigationBar
        let appearance = UINavigationBarAppearance()
        appearance.shadowImage = nil
        appearance.shadowColor = nil
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.backgroundColor = ThemeManager.current.navigationBarColor
        navigationBar?.tintColor = UIColor.white
        navigationBar?.standardAppearance = appearance
        navigationBar?.scrollEdgeAppearance = navigationBar?.standardAppearance
        navigationBar?.isTranslucent = false
    }
    func setupCenterNavItems(title : String) {
        delegate?.navigationItem.title = title
    }
   
    func setupLeftNavItems(text: String) {
        let leftLabel = UILabel()
        leftLabel.text = text
        helloMsg = text
        leftLabel.textColor = UIColor.white
        leftLabel.font = .systemFont(ofSize: 20)
        delegate?.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftLabel)
    }
    func setupRightnavItems(imageName: String = "menu") {
        // temporary fix
        let sizeByImg = ["menu": CGRect(x: 10, y: 12, width: 4, height: 20),
                         "close": CGRect(x: 2, y: 5, width: 35, height: 35)]
        let size = sizeByImg[imageName, default:  CGRect(x: 8, y: 12, width: 4, height: 20)] // default size for all image is 8, 32
        
        let imageView = UIImageView(frame: size)
        let image = UIImage(named: imageName)
        imageView.image = image
        
        rightBtn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
//        rightBtn.setBackgroundImage(UIImage(named: imageName), for: .normal)
        rightBtn.addSubview(imageView)
        //rightBtn.addTarget(self, action: #selector(menuClick), for: .touchUpInside)
        delegate?.navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: rightBtn)]
    }
    func setupHeaderBar(headerBarLbl: String) {
        let headerBar = HeaderBar()
        headerBar.headerLbl.text = headerBarLbl
        divisionMsg = headerBarLbl
        delegate?.view.addSubview(headerBar)
        delegate?.view.addConstraintsWithFormat(format: "H:|[v0]|", views: headerBar)
        delegate?.view.addConstraintsWithFormat(format: "V:|[v0(30)]", views: headerBar)
    }

}
