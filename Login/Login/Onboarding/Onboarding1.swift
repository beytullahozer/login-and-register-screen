//
//  Onboarding1.swift
//  Login
//
//  Created by Beytullah Özer on 24.03.2022.
//


import UIKit
import Hero


class Onboarding1VC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        setDefaultSize(view: view)
        createUI()
        
    }
        
    
    func createUI(){
        
       
        view.backgroundColor = .white
      
        let loginBtn = UIButton()
        loginBtn.setTitle(NSLocalizedString("Log In", comment: ""), for: UIControl.State.normal)
        loginBtn.setTitleColor(UIColor.black, for: UIControl.State.normal)
        loginBtn.frame = CGRect(x: 0.8 * screenWidth, y: 0.07 * screenHeight, width: 0.15 * screenWidth, height: 0.07 * screenHeight)
        loginBtn.contentVerticalAlignment.self = .center
        loginBtn.contentHorizontalAlignment.self = .right
        loginBtn.titleLabel?.font = font_SFProBold(size: 14)
        view.addSubview(loginBtn)
        loginBtn.addTarget(self, action: #selector(loginBtnClicked), for: UIControl.Event.touchUpInside)
        
        let onboardingImage = UIImageView()
        onboardingImage.image = UIImage(named: "img_onboardin1")
        onboardingImage.frame = CGRect(x: 0.07 * screenWidth, y: 0.15 * screenHeight, width: 0.86 * screenWidth, height: 0.86 * screenWidth)
        view.addSubview(onboardingImage)
        lastObjectFrane = onboardingImage.frame
    
        
        let sliderImage = UIImageView()
        sliderImage.image = UIImage(named: "img_slider1")
        sliderImage.frame = CGRect(x: 0.45 * screenWidth, y: lastObjectFrane.maxY + 0.05 * screenHeight, width: 0.1 * screenWidth, height: 0.03 * screenWidth)
        sliderImage.contentMode = .scaleAspectFit
        view.addSubview(sliderImage)
        lastObjectFrane = sliderImage.frame
        
        
        let onboardingLabel = UILabel()
        onboardingLabel.textColor = .black
        onboardingLabel.text = "Customize and create simple invoices"
        onboardingLabel.numberOfLines = 2
        onboardingLabel.textAlignment = .center
        onboardingLabel.font = font_SFProBold(size: 30)
        onboardingLabel.frame = CGRect(x: 0.1 * screenWidth, y: lastObjectFrane.maxY + 0 * screenHeight, width: 0.8 * screenWidth, height: 0.12 * screenHeight)
        view.addSubview(onboardingLabel)
        lastObjectFrane = onboardingLabel.frame
        
        let continueBtn = UIButton()
        continueBtn.setTitle(NSLocalizedString("Continue", comment: ""), for: UIControl.State.normal)
        continueBtn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        continueBtn.frame = CGRect(x: 0.05 * screenWidth, y: lastObjectFrane.maxY + 0.09 * screenHeight , width: 0.9 * screenWidth, height: 0.15 * screenWidth)
        continueBtn.contentVerticalAlignment.self = .center
        continueBtn.contentHorizontalAlignment.self = .center
        continueBtn.backgroundColor = clr_blue
        continueBtn.titleLabel?.font = font_SFProBold(size: 14)
        view.addSubview(continueBtn)
        continueBtn.addTarget(self, action: #selector(continueBtnClicked), for: UIControl.Event.touchUpInside)
        continueBtn.addCornerRadious()
    }

    @objc func loginBtnClicked(){
        
        uDefaults.setValue("user", forKey: "user")
        presentVC(currentVC: self, destinationVC: LoginVC(), toDirection: .right)
        
    }
    
    @objc func continueBtnClicked(){
        
        presentVC(currentVC: self, destinationVC: LoginVC(), toDirection: .right)
        
    }
}

