//
//  FieldHandler.swift
//  Invoice Maker
//
//  Created by Tuna Öztürk on 20.03.2022.
//

import Foundation
import UIKit

enum TextfieldType {
    case number
    case decimal
    case string
    case date
}

enum ToggleType {
    case discountType
    case invoiceStatus
}


func creatToggle(title: String, type : ToggleType, onView : UIView, VC : UIViewController, didChange: @escaping () ->() ){
    
    addTitle(title: "\(title)", onView: onView)

    let option1Btn = UIButton()
    let option2Btn = UIButton()
    
    switch type {
    case .discountType:
        option1Btn.setTitle(NSLocalizedString("  Fixed", comment: ""), for: UIControl.State.normal)
        option2Btn.setTitle(NSLocalizedString("  Percentage", comment: ""), for: UIControl.State.normal)
        
        if selectedDiscountType == .fixed{
            
            option1Btn.setImage(UIImage(named: "btn_filled"),for: .normal)
            option2Btn.setImage(UIImage(named: "btn_empty"),for: .normal)
            
        }else if selectedDiscountType == .percentage{
            
            option1Btn.setImage(UIImage(named: "btn_empty"),for: .normal)
            option2Btn.setImage(UIImage(named: "btn_filled"),for: .normal)
            
        }
    case .invoiceStatus:
        option1Btn.setTitle(NSLocalizedString("  Outstanding", comment: ""), for: UIControl.State.normal)
        option2Btn.setTitle(NSLocalizedString("  Paid", comment: ""), for: UIControl.State.normal)

        
        if selectedInvoiceStatus == .outstanding{
            
            option1Btn.setImage(UIImage(named: "btn_filled"),for: .normal)
            option2Btn.setImage(UIImage(named: "btn_empty"),for: .normal)
            
        }else if selectedInvoiceStatus == .paid{
            
            option1Btn.setImage(UIImage(named: "btn_empty"),for: .normal)
            option2Btn.setImage(UIImage(named: "btn_filled"),for: .normal)
            
        }
        
    }
    
    option1Btn.addAction { [VC] in
       
      
        
        switch type {
        case .discountType:
            selectedDiscountType = .fixed
        case .invoiceStatus:
            selectedInvoiceStatus = .outstanding
        }
        
        option1Btn.setImage(UIImage(named: "btn_filled"),for: .normal)
        option2Btn.setImage(UIImage(named: "btn_empty"),for: .normal)
    
        didChange()
    }
    
    option1Btn.setTitleColor(UIColor.black, for: UIControl.State.normal)
    option1Btn.frame = CGRect(x: 0.05  * screenWidth, y: lastObjectFrane.maxY + 0.005 * screenHeight, width: 0.4 * screenWidth, height: 0.07 * screenHeight)
    option1Btn.contentVerticalAlignment.self = .center
    option1Btn.contentHorizontalAlignment.self = .left
    option1Btn.titleLabel?.font = font_SFProSemiBold(size: 18)
    lastObjectFrane = option1Btn.frame
    onView.addSubview(option1Btn)


    option2Btn.addAction { [VC] in
       
     
        
        switch type {
        case .discountType:
            selectedDiscountType = .percentage
        case .invoiceStatus:
            selectedInvoiceStatus = .paid
        }
        
        option1Btn.setImage(UIImage(named: "btn_empty"),for: .normal)
        option2Btn.setImage(UIImage(named: "btn_filled"),for: .normal)
        
        didChange()
    
    }
    
  
    option2Btn.setTitleColor(UIColor.black, for: UIControl.State.normal)
    option2Btn.frame = CGRect(x: lastObjectFrane.maxX + 0.05  * screenWidth, y: lastObjectFrane.minY, width: 0.4 * screenWidth, height: 0.07 * screenHeight)
    option2Btn.contentVerticalAlignment.self = .center
    option2Btn.contentHorizontalAlignment.self = .left
    option2Btn.titleLabel?.font = font_SFProSemiBold(size: 18)
    lastObjectFrane = option2Btn.frame
    onView.addSubview(option2Btn)

    
    
  

}




func createTextField(placeholder : String, text : String, type: TextfieldType, title: String, onView : UIView, VC : UIViewController) -> UITextField{
    
    addTitle(title: "\(title)", onView: onView)
    
    let textField = UITextField()
    textField.frame = CGRect(x: 0.05 * screenWidth, y: lastObjectFrane.maxY + 0 * screenHeight, width: 0.9 * screenWidth, height: 0.044 * screenHeight)
    textField.placeholder = "\(placeholder)"
    textField.text = text
    textField.textColor = clr_placeholder
    textField.font = font_SFProRegular(size: 14)
    textField.clearButtonMode = .whileEditing
    textField.autocorrectionType = .no
    textField.autocapitalizationType = .none
    
    switch type {
    case .number:
        textField.keyboardType = .numberPad
    case .decimal:
        textField.keyboardType = .decimalPad
    case .string:
        textField.keyboardType = .default
    case .date:
        textField.setDatePickerAsInputViewFor(target: VC)
    }
    lastObjectFrane = textField.frame
    onView.addSubview(textField)
    
    addSeperator(onView: onView)
    
    return textField
}

func addSeperator(onView : UIView){
    
    let seperator = UIView()
    seperator.backgroundColor = clr_seperator
    seperator.frame = CGRect(x: 0.05 * screenWidth, y: lastObjectFrane.maxY + 0.005 * screenHeight , width: 0.9 * screenWidth, height: 0.7)
    lastObjectFrane = seperator.frame
    onView.addSubview(seperator)
}

func addSpace(height : CGFloat, onView : UIView){
    
    let space = UIView()
    space.frame = CGRect(x: 0.05 * screenWidth, y: lastObjectFrane.maxY + 0.01 * screenHeight , width: 0.9 * screenWidth, height: height)
    lastObjectFrane = space.frame
    onView.addSubview(space)
}

func addTitle(title : String, onView : UIView){
    
    let titleLabel = UILabel()
    titleLabel.textColor = .black
    titleLabel.text = title
    titleLabel.textAlignment = .left
    titleLabel.font = font_SFProSemiBold(size: 18)
    titleLabel.frame = CGRect(x: 0.05 * screenWidth, y: lastObjectFrane.maxY + 0.015 * screenHeight, width: 0.9 * screenWidth, height: 0.025 * screenHeight)
    lastObjectFrane = titleLabel.frame
    onView.addSubview(titleLabel)
    
 
 
}

func addBigTitle(title : String, onView : UIView){
    
    let titleLabel = UILabel()
    titleLabel.textColor = clr_blue
    titleLabel.text = title
    titleLabel.textAlignment = .left
    titleLabel.font = font_SFProSemiBold(size: 22)
    titleLabel.frame = CGRect(x: 0.05 * screenWidth, y: lastObjectFrane.maxY + 0.015 * screenHeight, width: 0.9 * screenWidth, height: 0.025 * screenHeight)
    lastObjectFrane = titleLabel.frame
    onView.addSubview(titleLabel)
    
    addSpace(height: 5, onView: onView)
    addSeperator(onView: onView)
    addSpace(height: 5, onView: onView)
 
}

