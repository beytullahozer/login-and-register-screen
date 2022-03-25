//
//  Client.swift
//  Invoice Maker
//
//  Created by Tuna Öztürk on 20.03.2022.
//

import Foundation
import Firebase

class Client{
    
    var name = String()
    var email = String()
    var phoneNumber = String()
    var fax = String()
    var contactName = String()
    var adress = String()
    var clientID = String()
    var invoices = [Invoice]()
    
    
    func getBalanceDue() -> Double{
        
        var totalBalanceDue = Double()
        
        for invoice in invoices {
            totalBalanceDue  += invoice.balanceDue
        }
        
        return totalBalanceDue
    }
}


