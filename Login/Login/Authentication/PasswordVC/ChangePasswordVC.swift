//
//  ViewController.swift
//  Login
//
//  Created by Beytullah Özer on 24.03.2022..
//

import UIKit
import Hero
import Firebase

class ChangePasswordVC: UIViewController {

    // Variables
    
    var isContinueActivated = false
    var emailAdress = ""
    // UI Elements
    
    let alertLabel = UILabel()
    let passwordTextfield = UITextField()
    let passwordLabel = UILabel()
    let passwordAgainTextfield = UITextField()
    let passwordAgainLabel = UILabel()
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
        titleLabel.text = "Change Password"
        titleLabel.numberOfLines = 2
        titleLabel.textAlignment = .center
        titleLabel.font = font_SFProBold(size: 30)
        titleLabel.frame = CGRect(x: 0.1 * screenWidth, y: 0.06 * screenHeight, width: 0.8 * screenWidth, height: 0.06 * screenHeight)
        view.addSubview(titleLabel)
    
        
      
        
        
        let passwordView = createPasswordView()
        passwordView.frame = CGRect(x: 0.05 * screenWidth, y: 0.32 * screenHeight, width: 0.9 * screenWidth, height: 0.085 * screenHeight)
        view.addSubview(passwordView)
        lastObjectFrane = passwordView.frame
        
        let passworAgaindView = createPasswordAgainView()
        passworAgaindView.frame = CGRect(x: 0.05 * screenWidth, y: lastObjectFrane.maxY + 0.02 * screenHeight, width: 0.9 * screenWidth, height: 0.085 * screenHeight)
        view.addSubview(passworAgaindView)
        lastObjectFrane = passworAgaindView.frame
        
        alertLabel.textColor = clr_alert
        alertLabel.text = "Passwords do not match"
        alertLabel.numberOfLines = 2
        alertLabel.textAlignment = .left
        alertLabel.font = font_SFProRegular(size: 12)
        alertLabel.frame = CGRect(x: 0.05 * screenWidth, y: lastObjectFrane.maxY + 0.02 * screenHeight, width: 1 * screenWidth, height: 0.03 * screenHeight)
        view.addSubview(alertLabel)
        lastObjectFrane = alertLabel.frame
        alertLabel.isHidden = true
        
    
        continueBtn.setTitle(NSLocalizedString("Change Password", comment: ""), for: UIControl.State.normal)
        continueBtn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        continueBtn.frame = CGRect(x: 0.05 * screenWidth, y: lastObjectFrane.maxY + 0.04 * screenHeight , width: 0.9 * screenWidth, height: 0.15 * screenWidth)
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

    
    func createPasswordView() -> UIView{
        
        
        let passwordView = UIView()
       
        passwordLabel.textColor = .black
        passwordLabel.text = "Password"
        passwordLabel.numberOfLines = 2
        passwordLabel.textAlignment = .left
        passwordLabel.font = font_SFProSemiBold(size: 18)
        passwordLabel.frame = CGRect(x: 0 * screenWidth, y: 0 * screenHeight, width: 0.8 * screenWidth, height: 0.035 * screenHeight)
        passwordView.addSubview(passwordLabel)
        
     
        passwordTextfield.frame = CGRect(x: 0 * screenWidth, y: 0.035 * screenHeight, width: 0.786 * screenWidth, height: 0.044 * screenHeight)
        passwordTextfield.placeholder = "New Password"
        passwordTextfield.textColor = clr_placeholder
        passwordTextfield.font = font_SFProRegular(size: 17)
        passwordTextfield.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        passwordView.addSubview(passwordTextfield)
        
        let passwordSeperator = UIView()
        passwordSeperator.backgroundColor = clr_seperator
        passwordSeperator.frame = CGRect(x: 0 * screenWidth, y: 0.085 * screenHeight , width: 0.9 * screenWidth, height: 0.5)
        passwordView.addSubview(passwordSeperator)
        
        return passwordView
        
    }
    
    func createPasswordAgainView() -> UIView{
        
        
        let passwordAgainView = UIView()
       
        passwordAgainLabel.textColor = .black
        passwordAgainLabel.text = "Re-enter your new password"
        passwordAgainLabel.numberOfLines = 2
        passwordAgainLabel.textAlignment = .left
        passwordAgainLabel.font = font_SFProSemiBold(size: 18)
        passwordAgainLabel.frame = CGRect(x: 0 * screenWidth, y: 0 * screenHeight, width: 0.8 * screenWidth, height: 0.035 * screenHeight)
        passwordAgainView.addSubview(passwordAgainLabel)
        
     
        passwordAgainTextfield.frame = CGRect(x: 0 * screenWidth, y: 0.035 * screenHeight, width: 0.786 * screenWidth, height: 0.044 * screenHeight)
        passwordAgainTextfield.placeholder = "Re-enter your new password"
        passwordAgainTextfield.textColor = clr_placeholder
        passwordAgainTextfield.font = font_SFProRegular(size: 17)
        passwordAgainTextfield.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        passwordAgainView.addSubview(passwordAgainTextfield)
        
        let passworAgaindSeperator = UIView()
        passworAgaindSeperator.backgroundColor = clr_seperator
        passworAgaindSeperator.frame = CGRect(x: 0 * screenWidth, y: 0.085 * screenHeight , width: 0.9 * screenWidth, height: 0.5)
        passwordAgainView.addSubview(passworAgaindSeperator)
        
        return passwordAgainView
        
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

        

        if passwordTextfield.text!.count >= 6 && passwordAgainTextfield.text!.count >= 6 &&  passwordTextfield.text == passwordAgainTextfield.text{
                
            isContinueActivated = true
            continueBtn.activated()
                
        }else{
                
            isContinueActivated = false
            continueBtn.deactivated()
                
        }
        
        
        if  passwordTextfield.text!.count >= 6 && passwordAgainTextfield.text!.count >= 6 &&  passwordTextfield.text != passwordAgainTextfield.text{
            
            alertLabel.isHidden = false
            alertLabel.text = "Passwords do not match"
            
        }else{
            
            alertLabel.isHidden = true
            
        }
        
        
        }
    
    
    @objc func termsBtnClicked(){
        
     
//        if let url = termsURL {
//            if UIApplication.shared.canOpenURL(url) {
//                UIApplication.shared.open(url, options: [:])
//            }
//
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
            
            changePassword()

        }
        
    }
    

    
    func changePassword(){
        
        let db = Firestore.firestore()
        let docRef = db.collection("Users").document(emailAdress).collection("Data").document("UserData")

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                if let password =  document.get("password") as? String{
                    Auth.auth().signIn(withEmail: self.emailAdress, password: password) { [self] authResult, error in
                        guard error == nil else { nonFatalError()
                            return }
                        Auth.auth().currentUser?.updatePassword(to: passwordTextfield.text!) { error in
                            guard error == nil else { nonFatalError()
                                return }
                            let db = Firestore.firestore()
                            db.collection("Users").document(self.emailAdress).collection("Data").document("UserData").updateData(["password": "\(self.passwordTextfield.text!)"])
                            presentVC(currentVC: self, destinationVC: LoginVC(), toDirection: .down)
                        }
                    }
                }
            } else {
                print("Document does not exist")
            }
        }
        
    }
    func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
        
        keyboardClosed()
        return true
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        keyboardClosed()
    }
    
    func nonFatalError(){
        
        alertLabel.isHidden = false
        alertLabel.text = "Something went wrong! Please try again."
        
    }
    func keyboardClosed(){
        
    self.view.endEditing(true)
   
        
    }
    
}
