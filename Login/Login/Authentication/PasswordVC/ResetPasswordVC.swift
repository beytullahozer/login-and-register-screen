//
//  ViewController.swift
//  Login
//
//  Created by Beytullah Özer on 24.03.2022..
//

import UIKit
import Hero
import FirebaseAuth


class ResetPasswordVC: UIViewController {

    // Variables
    
    var isCodeSent = false
    var isContinueActivated = false
    var OTP = 0
    var emailAdress = ""
    // UI Elements
    
    let alertLabel = UILabel()
    let emailTextfield = UITextField()
    let emailLabel = UILabel()
    let continueBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        setDefaultSize(view: view)
        createUI()
        
    }
        
    
    func createUI(){
        
       
        view.backgroundColor = .white
      
        let titleLabel = UILabel()
        titleLabel.textColor = .black
        titleLabel.text = "Password reset"
        titleLabel.numberOfLines = 2
        titleLabel.textAlignment = .center
        titleLabel.font = font_SFProBold(size: 30)
        titleLabel.frame = CGRect(x: 0.1 * screenWidth, y: 0.06 * screenHeight, width: 0.8 * screenWidth, height: 0.06 * screenHeight)
        view.addSubview(titleLabel)
    
        
        alertLabel.textColor = .black
        alertLabel.text = "We have sent a recovery code\nto your email"
        alertLabel.numberOfLines = 2
        alertLabel.textAlignment = .center
        alertLabel.font = font_SFProRegular(size: 16)
        alertLabel.frame = CGRect(x: 0 * screenWidth, y: 0.2 * screenHeight, width: 1 * screenWidth, height: 0.07 * screenHeight)
        view.addSubview(alertLabel)
        lastObjectFrane = alertLabel.frame
        alertLabel.isHidden = true
        
        
        let emailView = createEmailView()
        emailView.frame = CGRect(x: 0.05 * screenWidth, y: 0.32 * screenHeight, width: 0.9 * screenWidth, height: 0.085 * screenHeight)
        view.addSubview(emailView)
        lastObjectFrane = emailView.frame
        
        
    
        continueBtn.setTitle(NSLocalizedString("Send reset code", comment: ""), for: UIControl.State.normal)
        continueBtn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        continueBtn.frame = CGRect(x: 0.05 * screenWidth, y: lastObjectFrane.maxY + 0.05 * screenHeight , width: 0.9 * screenWidth, height: 0.15 * screenWidth)
        continueBtn.contentVerticalAlignment.self = .center
        continueBtn.contentHorizontalAlignment.self = .center
        continueBtn.layer.borderWidth = 2
        continueBtn.layer.borderColor = clr_blue.cgColor
        continueBtn.titleLabel?.font = font_SFProBold(size: 16)
        view.addSubview(continueBtn)
        continueBtn.addTarget(self, action: #selector(continueBtnClicked), for: UIControl.Event.touchUpInside)
        continueBtn.addCornerRadious()
        continueBtn.deactivated()
        lastObjectFrane = continueBtn.frame
      
        
        createPrivacyAndTermsView()
        
    }

    
    func createEmailView() -> UIView{
        
        
        let emailView = UIView()
       
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
        emailTextfield.font = font_SFProRegular(size: 17)
        emailTextfield.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        emailView.addSubview(emailTextfield)
        
        let emailSeperator = UIView()
        emailSeperator.backgroundColor = clr_seperator
        emailSeperator.frame = CGRect(x: 0 * screenWidth, y: 0.085 * screenHeight , width: 0.9 * screenWidth, height: 0.5)
        emailView.addSubview(emailSeperator)
        
        return emailView
        
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
    
   
    @objc func textFieldDidChange(_ textField: UITextField) {

        
        emailTextfield.text = emailTextfield.text?.lowercased()
        
        if !isCodeSent {
 
            if !isValidEmail(emailTextfield.text!){
            
                isContinueActivated = false
                continueBtn.deactivated()
            
            }else{
            
                isContinueActivated = true
                continueBtn.activated()
           
            
        }
            
        }else{
            
            
            if emailTextfield.text!.count < 6{
                
                isContinueActivated = false
                continueBtn.deactivated()
                
            }else{
                
                isContinueActivated = true
                continueBtn.activated()
               
                
            }
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
    
    @objc func continueBtnClicked(){
        
        
      
        if isContinueActivated{
            
        if !isCodeSent {
            
            emailAdress = emailTextfield.text!
            OTP = createOTP()
            EmailAPIHandler().sendEmail(toEmail: emailTextfield.text!, code: "\(OTP)")
            
            alertLabel.isHidden = false
            isCodeSent = true
            emailLabel.text = "Code"
            emailTextfield.text = ""
            emailTextfield.placeholder = "Enter the code we sent to your email"
            continueBtn.deactivated()
            continueBtn.setTitle("Continue", for: .normal)
            
       
            
        }else{
            
            if let inputCode = Int((emailTextfield.text)!) , OTP == inputCode{
                
             
                let destinationVC = ChangePasswordVC()
                destinationVC.emailAdress = emailAdress
                presentAsPageSheet(currentVC: self, destinationVC:  destinationVC)
                
                
            }else{
                
                
                alertLabel.text = "Ops! The secret code seems to be wrong.\nPlease check it and try again."
                alertLabel.textColor = clr_alert
            }
           
        }
     
        }
        
    }
    

    
    func createOTP() -> Int {
        var number = String()
        for _ in 1...6 {
           number += "\(Int.random(in: 1...9))"
        }
        return Int(number)!
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
