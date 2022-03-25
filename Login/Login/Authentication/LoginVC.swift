//
//  ViewController.swift
//  Login
//
//  Created by Beytullah Özer on 24.03.2022.
//

import UIKit
import Hero
import Firebase

class LoginVC: UIViewController {

    // Variables
    var isPasswordHidden = true
    var isLoginActivated = false
    
    
    // UI Elements
    let alertLabel = UILabel()
    let showPasswordBtn = UIButton()
    let passwordTextfield = UITextField()
    let emailTextfield = UITextField()
    let loginBtn = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        setDefaultSize(view: view)
        setTextFieldDelegate()
        createUI()
        
    }
        
    
    func createUI(){
        
       
        view.backgroundColor = .white
      
        let titleLabel = UILabel()
        titleLabel.textColor = .black
        titleLabel.text = "Log in"
        titleLabel.numberOfLines = 2
        titleLabel.textAlignment = .center
        titleLabel.font = font_SFProBold(size: 30)
        titleLabel.frame = CGRect(x: 0.1 * screenWidth, y: 0.06 * screenHeight, width: 0.8 * screenWidth, height: 0.06 * screenHeight)
        view.addSubview(titleLabel)
    
        
        let emailView = createEmailView()
        emailView.frame = CGRect(x: 0.05 * screenWidth, y: 0.35 * screenHeight, width: 0.9 * screenWidth, height: 0.085 * screenHeight)
        view.addSubview(emailView)
        lastObjectFrane = emailView.frame
        
        
        let passwordView = createPasswordView()
        passwordView.frame = CGRect(x: 0.05 * screenWidth, y: lastObjectFrane.maxY + 0.015 * screenHeight, width: 0.9 * screenWidth, height: 0.085 * screenHeight)
        view.addSubview(passwordView)
        lastObjectFrane = passwordView.frame
        
        
      
        alertLabel.textColor = UIColor(red: 1.00, green: 0.19, blue: 0.19, alpha: 1.00)
        alertLabel.text = "The email or password is incorrect"
        alertLabel.numberOfLines = 2
        alertLabel.textAlignment = .center
        alertLabel.font = font_SFProRegular(size: 12)
        alertLabel.frame = CGRect(x: 0 * screenWidth, y: lastObjectFrane.maxY + 0.016 * screenHeight, width: 1 * screenWidth, height: 0.02 * screenHeight)
        view.addSubview(alertLabel)
        lastObjectFrane = alertLabel.frame
        alertLabel.isHidden = true
        
      
        loginBtn.setTitle(NSLocalizedString("Login", comment: ""), for: UIControl.State.normal)
        loginBtn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        loginBtn.frame = CGRect(x: 0.05 * screenWidth, y: lastObjectFrane.maxY + 0.02 * screenHeight , width: 0.9 * screenWidth, height: 0.15 * screenWidth)
        loginBtn.contentVerticalAlignment.self = .center
        loginBtn.contentHorizontalAlignment.self = .center
        loginBtn.layer.borderWidth = 2
        loginBtn.layer.borderColor = clr_blue.cgColor
        loginBtn.titleLabel?.font = font_SFProBold(size: 16)
        view.addSubview(loginBtn)
        loginBtn.addTarget(self, action: #selector(loginBtnClicked), for: UIControl.Event.touchUpInside)
        loginBtn.addCornerRadious()
        loginBtn.deactivated()
        lastObjectFrane = loginBtn.frame
      
        
        
        let signUpBtn = UIButton()
        signUpBtn.setTitle(NSLocalizedString("Sign up", comment: ""), for: UIControl.State.normal)
        signUpBtn.setTitleColor(UIColor.black, for: UIControl.State.normal)
        signUpBtn.frame = CGRect(x: 0.05 * screenWidth, y: lastObjectFrane.maxY + 0.015 * screenHeight , width: 0.9 * screenWidth, height: 0.15 * screenWidth)
        signUpBtn.contentVerticalAlignment.self = .center
        signUpBtn.contentHorizontalAlignment.self = .center
        signUpBtn.backgroundColor = .clear
        signUpBtn.layer.borderWidth = 2
        signUpBtn.layer.borderColor = clr_blue.cgColor
        signUpBtn.titleLabel?.font = font_SFProBold(size: 16)
        view.addSubview(signUpBtn)
        signUpBtn.addTarget(self, action: #selector(signUpBtnClicked), for: UIControl.Event.touchUpInside)
        signUpBtn.addCornerRadious()
        lastObjectFrane = signUpBtn.frame
     
        
        let resetPasswordBtn = createResetPasswordBtn()
        resetPasswordBtn.frame = CGRect(x: 0.05 * screenWidth, y: lastObjectFrane.maxY + 0.03 * screenHeight , width: 0.9 * screenWidth, height: 0.05 * screenWidth)
        view.addSubview(resetPasswordBtn)
        lastObjectFrane = resetPasswordBtn.frame
    
       
        createPrivacyAndTermsView()
        
    }

    
    func createEmailView() -> UIView{
        
        
        let emailView = UIView()
    
        let emailLabel = UILabel()
        emailLabel.textColor = .black
        emailLabel.text = "Email"
        emailLabel.numberOfLines = 2
        emailLabel.textAlignment = .left
        emailLabel.font = font_SFProSemiBold(size: 18)
        emailLabel.frame = CGRect(x: 0 * screenWidth, y: 0 * screenHeight, width: 0.8 * screenWidth, height: 0.035 * screenHeight)
        emailView.addSubview(emailLabel)
        
     
        emailTextfield.frame = CGRect(x: 0 * screenWidth, y: 0.035 * screenHeight, width: 0.786 * screenWidth, height: 0.044 * screenHeight)
        emailTextfield.placeholder = "Your email adress"
        emailTextfield.textColor = clr_placeholder
        emailTextfield.font = font_SFProRegular(size: 14)
        emailTextfield.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        emailView.addSubview(emailTextfield)
        
        let emailSeperator = UIView()
        emailSeperator.backgroundColor = clr_seperator
        emailSeperator.frame = CGRect(x: 0 * screenWidth, y: 0.085 * screenHeight , width: 0.9 * screenWidth, height: 0.5)
        emailView.addSubview(emailSeperator)
        
        return emailView
        
    }
    
    func createPasswordView() -> UIView{
        
        
        let passwordView = UIView()
    
        let passwordLabel = UILabel()
        passwordLabel.textColor = .black
        passwordLabel.text = "Password"
        passwordLabel.numberOfLines = 2
        passwordLabel.textAlignment = .left
        passwordLabel.font = font_SFProSemiBold(size: 18)
        passwordLabel.frame = CGRect(x: 0 * screenWidth, y: 0 * screenHeight, width: 0.8 * screenWidth, height: 0.035 * screenHeight)
        passwordView.addSubview(passwordLabel)
        
      
        passwordTextfield.isSecureTextEntry = true
        passwordTextfield.frame = CGRect(x: 0 * screenWidth, y: 0.035 * screenHeight, width: 0.786 * screenWidth, height: 0.044 * screenHeight)
        passwordTextfield.placeholder = "Your password"
        passwordTextfield.textColor = clr_placeholder
        passwordTextfield.font = font_SFProRegular(size: 14)
        passwordTextfield.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        passwordView.addSubview(passwordTextfield)
        
     
        showPasswordBtn.setBackgroundImage(UIImage(named: "btn_showPassword")!.withRenderingMode(.alwaysTemplate), for: .normal)
        showPasswordBtn.frame = CGRect(x: 0.85 * screenWidth, y: 0.035 * screenHeight , width: 0.05 * screenWidth, height: 0.038 * screenWidth)
        showPasswordBtn.tintColor = clr_blue
        showPasswordBtn.contentMode = .scaleAspectFit
        passwordView.addSubview(showPasswordBtn)
        showPasswordBtn.center.y = passwordTextfield.center.y
        showPasswordBtn.addTarget(self, action: #selector(showPasswordBtnClicked), for: UIControl.Event.touchUpInside)
        
        let passwordSeperator = UIView()
        passwordSeperator.backgroundColor = clr_seperator
        passwordSeperator.frame = CGRect(x: 0 * screenWidth, y: 0.085 * screenHeight , width: 0.9 * screenWidth, height: 0.5)
        passwordView.addSubview(passwordSeperator)
        
        return passwordView
        
    }
    

    func createResetPasswordBtn() -> UIButton{
        
        
        let resetPasswordBtn = UIButton()
        resetPasswordBtn.setTitleColor(UIColor.black, for: UIControl.State.normal)
        resetPasswordBtn.contentVerticalAlignment.self = .center
        resetPasswordBtn.contentHorizontalAlignment.self = .center
        resetPasswordBtn.backgroundColor = .clear
        resetPasswordBtn.addTarget(self, action: #selector(resetPasswordBtnClicked), for: UIControl.Event.touchUpInside)

      
        
        let firstStr = "Forget your password? "
        let firstAttr = [ NSAttributedString.Key.font: font_SFProRegular(size: 14) ]
        let firstAttrStr = NSMutableAttributedString(string: firstStr, attributes: firstAttr)

        
        let secondStr = "Reset"
        let secondAttr = [ NSAttributedString.Key.font: font_SFProBold(size: 14),
                           NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue ] as [NSAttributedString.Key : Any]
        let secondAttrStr = NSMutableAttributedString(string: secondStr, attributes: secondAttr)
        
        
        firstAttrStr.append(secondAttrStr)
        resetPasswordBtn.setAttributedTitle(firstAttrStr, for: .normal)
        
        return resetPasswordBtn
    }
    
    
    func createPrivacyAndTermsView(){
        
        let privacyBtn = UIButton()
        privacyBtn.setTitleColor(UIColor.black, for: UIControl.State.normal)
        privacyBtn.contentVerticalAlignment.self = .center
        privacyBtn.contentHorizontalAlignment.self = .center
        privacyBtn.backgroundColor = .clear
        privacyBtn.titleLabel?.font = font_SFProSemiBold(size: 14)
        privacyBtn.setTitle("Privacy Policy", for: .normal)
        privacyBtn.addTarget(self, action: #selector(privacyBtnClicked), for: UIControl.Event.touchUpInside)
        privacyBtn.frame = CGRect(x: 0.15 * screenWidth, y: 0.85 * screenHeight , width: 0.3 * screenWidth, height: 0.15 * screenWidth)
        view.addSubview(privacyBtn)
        
        let termsBtn = UIButton()
        termsBtn.setTitleColor(UIColor.black, for: UIControl.State.normal)
        termsBtn.contentVerticalAlignment.self = .center
        termsBtn.contentHorizontalAlignment.self = .center
        termsBtn.backgroundColor = .clear
        termsBtn.titleLabel?.font = font_SFProSemiBold(size: 14)
        termsBtn.setTitle("Terms & Conditions", for: .normal)
        termsBtn.addTarget(self, action: #selector(termsBtnClicked), for: UIControl.Event.touchUpInside)
        termsBtn.frame = CGRect(x: 0.55 * screenWidth, y: 0.85 * screenHeight , width: 0.3 * screenWidth, height: 0.15 * screenWidth)
        view.addSubview(termsBtn)
        
    }
    
    @objc func showPasswordBtnClicked(){
        
        
        if isPasswordHidden{
            
            passwordTextfield.font = font_SFProRegular(size: 14)
            passwordTextfield.isSecureTextEntry = false
            isPasswordHidden = false
            showPasswordBtn.tintColor = clr_placeholder
            
        }else{
            
            passwordTextfield.font = font_SFProRegular(size: 20)
            passwordTextfield.isSecureTextEntry = true
            isPasswordHidden = true
            showPasswordBtn.tintColor = clr_blue
        }
        
        if passwordTextfield.text == ""{
            
            passwordTextfield.font = font_SFProRegular(size: 14)
            
        }
        
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {

        
        emailTextfield.text = emailTextfield.text?.lowercased()
        
        if passwordTextfield.text == "" || !isPasswordHidden{
            
            passwordTextfield.font = font_SFProRegular(size: 14)
            
        }else{
            
            passwordTextfield.font = font_SFProRegular(size: 20)
            
        }
        
        if passwordTextfield.text!.count < 6 || !isValidEmail(emailTextfield.text!){
            
            isLoginActivated = false
            loginBtn.deactivated()
            
        }else{
            
            isLoginActivated = true
            loginBtn.activated()
           
            
        }
    }
   
    @objc func termsBtnClicked(){
        
     
//        if let url = termsURL {
//            if UIApplication.shared.canOpenURL(url) {
//                UIApplication.shared.open(url, options: [:])
//            }
//        }
        
    }
    
    @objc func privacyBtnClicked(){
        
//        if let url = privacyURL {
//            if UIApplication.shared.canOpenURL(url) {
//                UIApplication.shared.open(url, options: [:])
//            }
//        }
        
    }
    
    @objc func loginBtnClicked(){
        
        
        if isLoginActivated{
            
           authenticateUser()
            
        }
    }
    
    func authenticateUser(){
        
        let email = emailTextfield.text!
        let password = passwordTextfield.text!

        Auth.auth().signIn(withEmail: email, password: password) { [self] (authResult, error) in
            if authResult != nil {
                presentVC(currentVC: self, destinationVC: HomeVC(), toDirection: .down)
            }
            if error != nil {
                alertLabel.isHidden = false
            }
        }
    }
    
    
    
    @objc func resetPasswordBtnClicked(){
        presentAsPageSheet(currentVC: self, destinationVC:  ResetPasswordVC())
      
    }
    
    
    @objc func signUpBtnClicked(){
        
        presentVC(currentVC: self, destinationVC: SignupVC(), toDirection: .right)
     
    }
    
    @objc func setTextFieldDelegate(){
        
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        

    }
    
    @objc  func keyboardWillShow(notification: NSNotification) {
        
          if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
              if view.frame.origin.y == 0 {
                 self.view.frame.origin.y -= keyboardSize.height / 2
              }
            
          }
      }

      @objc  func keyboardWillHide(notification: NSNotification) {
        
          if view.frame.origin.y != 0 {
              self.view.frame.origin.y = 0
          }
        
      }
    
    func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
        
        keyboardClosed()
        return true
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        keyboardClosed()
    }
    
    
    func keyboardClosed(){
        
    self.view.endEditing(true)
   
        
    }
    
    

}
