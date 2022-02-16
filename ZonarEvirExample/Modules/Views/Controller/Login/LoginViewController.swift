//
//  LoginViewController.swift
//  ZonarEvirExample
//
//  Created by gcshcm on 16/02/2022.
//

import Foundation
import UIKit
import MaterialComponents.MaterialTextFields

class LoginViewController: UIViewController {
    var isHidePassword = true
    var toggleShowButton: UIButton!
    var emailTextField: MDCTextField!
    var passwordTextField: MDCTextField!
    var signInButton: UIButton!
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()
      
        view.backgroundColor = UIColor(hexString: "#FF21272C")
        
        // Do any additional setup after loading the view.
        emailTextField = MDCTextField(frame: CGRect(x: 57, y: 250, width: 300, height: 40))
        emailTextField.textColor = UIColor.white
        view.addSubview(emailTextField)
        emailTextField.placeholderLabel.textColor = .white
        emailTextField.placeholderLabel.text = "Email Address"
        emailTextField.autocapitalizationType = .none
        emailTextField.delegate = self
        
        passwordTextField = MDCTextField(frame: CGRect(x: 57, y: 350, width: 300, height: 40))
        passwordTextField.textColor = UIColor.white
        view.addSubview(passwordTextField)
        passwordTextField.placeholderLabel.textColor = .white
        passwordTextField.placeholderLabel.text = "Password"
        passwordTextField.isSecureTextEntry = isHidePassword
        passwordTextField.delegate = self
        
        toggleShowButton = UIButton(frame: CGRect(x: 0, y: 0, width: 5, height: 5))
        toggleShowButton.setImage(UIImage(named: "visibility"), for: .normal)
        toggleShowButton.addTarget(self, action: #selector(onToggleButtonClick), for: .touchUpInside)
        passwordTextField.rightView = toggleShowButton
        passwordTextField.rightViewMode = .always
        
        signInButton = UIButton(frame: CGRect(x: 57, y: 430, width: 300, height: 40))
        signInButton.setTitle("Sign in", for: .normal)
        signInButton.titleLabel?.font = UIFont.systemFont(ofSize: 16.0)
        signInButton.backgroundColor = .gray
        signInButton.titleLabel?.textColor = .white
        signInButton.layer.cornerRadius = 3
        signInButton.addTarget(self, action: #selector(onSignInButtonClick), for: .touchUpInside)
        view.addSubview(signInButton)

        NSLayoutConstraint.activate([
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            emailTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 500),
            emailTextField.heightAnchor.constraint(equalToConstant: 60),
            
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            passwordTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            passwordTextField.heightAnchor.constraint(equalToConstant: 60),
            
            toggleShowButton.heightAnchor.constraint(equalToConstant: 20),
            toggleShowButton.widthAnchor.constraint(equalToConstant: 20),
            
//            signInButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
//            signInButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
//            signInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
//            signInButton.heightAnchor.constraint(equalToConstant: 50)
                                    
        ])
            
    }
    
    @objc func onToggleButtonClick(sender: AnyObject) {
        passwordTextField.isSecureTextEntry.toggle()
        if(passwordTextField.isSecureTextEntry){
            toggleShowButton.setImage(UIImage(named: "visibility"), for: .normal)
        }
        else{
            toggleShowButton.setImage(UIImage(named: "visibility_off"), for: .normal)
        }
    }
    @objc func onSignInButtonClick(sender: AnyObject) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "HomeViewController")
        print("Button sign in Clicked")
        if let navigationController = self.navigationController {
            print("Có Navigation Controller")
            navigationController.pushViewController(vc, animated: true)
        }
        else{
            print("Không có Navigation Controller")
        }
    }

}
extension LoginViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("End Editing of \(String(describing: textField.placeholder))")
    }
}

extension UIColor {
    convenience init?(hexString: String?) {
        let input: String! = (hexString ?? "")
            .replacingOccurrences(of: "#", with: "")
            .uppercased()
        var alpha: CGFloat = 1.0
        var red: CGFloat = 0
        var blue: CGFloat = 0
        var green: CGFloat = 0
        switch (input.count) {
        case 3 /* #RGB */:
            red = Self.colorComponent(from: input, start: 0, length: 1)
            green = Self.colorComponent(from: input, start: 1, length: 1)
            blue = Self.colorComponent(from: input, start: 2, length: 1)
            break
        case 4 /* #ARGB */:
            alpha = Self.colorComponent(from: input, start: 0, length: 1)
            red = Self.colorComponent(from: input, start: 1, length: 1)
            green = Self.colorComponent(from: input, start: 2, length: 1)
            blue = Self.colorComponent(from: input, start: 3, length: 1)
            break
        case 6 /* #RRGGBB */:
            red = Self.colorComponent(from: input, start: 0, length: 2)
            green = Self.colorComponent(from: input, start: 2, length: 2)
            blue = Self.colorComponent(from: input, start: 4, length: 2)
            break
        case 8 /* #AARRGGBB */:
            alpha = Self.colorComponent(from: input, start: 0, length: 2)
            red = Self.colorComponent(from: input, start: 2, length: 2)
            green = Self.colorComponent(from: input, start: 4, length: 2)
            blue = Self.colorComponent(from: input, start: 6, length: 2)
            break
        default:
            NSException.raise(NSExceptionName("Invalid color value"), format: "Color value \"%@\" is invalid.  It should be a hex value of the form #RBG, #ARGB, #RRGGBB, or #AARRGGBB", arguments:getVaList([hexString ?? ""]))
        }
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    static func colorComponent(from string: String!, start: Int, length: Int) -> CGFloat {
        let substring = (string as NSString)
            .substring(with: NSRange(location: start, length: length))
        let fullHex = length == 2 ? substring : "\(substring)\(substring)"
        var hexComponent: UInt64 = 0
        Scanner(string: fullHex)
            .scanHexInt64(&hexComponent)
        return CGFloat(Double(hexComponent) / 255.0)
    }
}
