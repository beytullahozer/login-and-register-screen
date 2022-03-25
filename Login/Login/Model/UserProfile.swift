//
//  UserProfile.swift
//  Invoice Maker
//
//  Created by Tuna Öztürk on 23.03.2022.
//

import Foundation


class UserProfile{
    
    var businessName = ""
    var email = ""
    var phoneNumber = ""
    var webSite = ""
    var adress = Adress()
    var paymentDetail = PaymentDetail()
    
}

class Adress{
    
    var adress = ""
    var country = ""
    var city = ""
    var zipCode = ""
    
}

class PaymentDetail{
    
    var accountName = ""
    var ibanNumber = ""
    var accountNumber = ""
    var bankName = ""
    var swiftCode = ""
    
}
