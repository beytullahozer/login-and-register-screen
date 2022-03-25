//
//  Invoice.swift
//  Invoice Maker
//
//  Created by Tuna Öztürk on 20.03.2022.
//

import Foundation
import UIKit
import Firebase

class Invoice{
    
  
    
    var invoiceNumber = Int()
    var invoiceDate = String()
    var dueDate = String()
    var poNumber = Int()
    var client = Client()
    var items = [Item]()
    var subtotal = Double()
    var discountAmount = Double()
    var tax = Double()
    var total = Double()
    var payments = Double()
    var balanceDue = Double()
    var paypalEmail = String()
    var checkRecipient = String()
    var bankTransferDetails = String()
    var signature = String()
    var invoiceStatus = InvoiceStatus.outstanding
    var notes = String()
    var invoiceID = String()
}



