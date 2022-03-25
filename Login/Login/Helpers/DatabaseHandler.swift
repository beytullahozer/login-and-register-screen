//
//  DatabaseHandler.swift
//  Invoice Maker
//
//  Created by Tuna Öztürk on 21.03.2022.
//

import Foundation
import Firebase

func fetchClients(){
    
    let db = Firestore.firestore()
    let docRef = db.collection("Users").document((Auth.auth().currentUser?.email)!).collection("Clients")
    docRef.getDocuments() { (querySnapshot, err) in
        if let err = err {
            print("Error getting documents: \(err)")
        } else {
            for document in querySnapshot!.documents {
                print("\(document.documentID) => \(document.data())")
                
                let documentData = document.data()
                if unwrapToString(variable: documentData["name"] as Any) != "" &&
                    unwrapToString(variable: documentData["email"] as Any) != "" &&
                    unwrapToString(variable: documentData["contactName"] as Any) != ""{
                    
                    
                    
                    let docRef = db.collection("Users").document((Auth.auth().currentUser?.email)!).collection("Invoices")
                    docRef.getDocuments() { (querySnapshot, err) in
                        if let err = err {
                            print("Error getting documents: \(err)")
                        } else {
                            for document in querySnapshot!.documents {

                                let documentData = document.data()
                   
                                let invoice = Invoice()
                                
                              
                                if unwrapToString(variable: documentData["invoiceStatus"] as Any) == "paid"{
                                    invoice.invoiceStatus = .paid
                                }else{
                                    invoice.invoiceStatus = .outstanding
                                }
                                
                                invoice.invoiceNumber = unwrapToInt(variable: documentData["invoiceNumber"] as Any)
                                invoice.invoiceDate = unwrapToString(variable: documentData["invoiceDate"] as Any)
                                invoice.dueDate = unwrapToString(variable: documentData["dueDate"] as Any)
                                invoice.poNumber = unwrapToInt(variable: documentData["poNumber"] as Any)
                                invoice.subtotal = unwrapToDouble(variable: documentData["subtotal"] as Any)
                                invoice.discountAmount = unwrapToDouble(variable: documentData["discountAmount"] as Any)
                                invoice.tax = unwrapToDouble(variable: documentData["tax"] as Any)
                                invoice.total = unwrapToDouble(variable: documentData["total"] as Any)
                                invoice.payments = unwrapToDouble(variable: documentData["payments"] as Any)
                                invoice.balanceDue = unwrapToDouble(variable: documentData["balanceDue"] as Any)
                                invoice.paypalEmail = unwrapToString(variable: documentData["paypalEmail"] as Any)
                                invoice.checkRecipient = unwrapToString(variable: documentData["checkRecipient"] as Any)
                                invoice.bankTransferDetails = unwrapToString(variable: documentData["bankTransferDetails"] as Any)
                                invoice.signature = unwrapToString(variable: documentData["signature"] as Any)
                                invoice.notes = unwrapToString(variable: documentData["notes"] as Any)
                                invoice.invoiceID = unwrapToString(variable: document.documentID as Any)
//                                invoice.client = client
                                
                                let docRef = db.collection("Users").document((Auth.auth().currentUser?.email)!).collection("Invoices").document("\(invoice.invoiceID)").collection("Items")
                                docRef.getDocuments() { (querySnapshot, err) in
                                    if let err = err {
                                        print("Error getting documents: \(err)")
                                    } else {
                                        for document in querySnapshot!.documents {

                                            let documentData = document.data()
                                            
                                            let item = Item()
                                            
                                            if unwrapToString(variable: documentData["discountType"] as Any) == "percentage"{
                                                item.discountType = .percentage
                                            }else{
                                                item.discountType = .fixed
                                            }
                                            
                                            
                                            item.description = unwrapToString(variable: documentData["description"] as Any)
                                            item.quantity = unwrapToInt(variable: documentData["quantity"] as Any)
                                            item.unitCost = unwrapToDouble(variable: documentData["unitCost"] as Any)
                                            item.total = unwrapToDouble(variable: documentData["total"] as Any)
                                            item.discountAmount = unwrapToDouble(variable: documentData["discountAmount"] as Any)
                                            item.notes = unwrapToString(variable: documentData["notes"] as Any)
                                            item.itemID = unwrapToString(variable: document.documentID as Any)
                                            invoice.items.append(item)
                                        }
                                    }
                                }
                            
                                
//                                client.invoices.append(invoice)
                                allInvoices.append(invoice)
                                NotificationCenter.default.post(name: Notification.Name("ReloadInvoices"), object: nil)
                                    
                                
                            }
                        }
                    }
                    
//                    allClients.append(client)
                    NotificationCenter.default.post(name: Notification.Name("ReloadClients"), object: nil)
                    
                }
            }
        }
    }
}



func fetchUserProfile(){
    
    let db = Firestore.firestore()
    let docRef = db.collection("Users").document((Auth.auth().currentUser?.email)!).collection("Data")
    docRef.getDocuments() { (querySnapshot, err) in
        if let err = err {
            print("Error getting documents: \(err)")
        } else {
            for document in querySnapshot!.documents {
                print("\(document.documentID) => \(document.data())")
                
                let documentData = document.data()
        
        
                userProfile.businessName = unwrapToString(variable: documentData["businessName"] as Any)
                userProfile.email = unwrapToString(variable: documentData["email"] as Any)
                userProfile.phoneNumber = unwrapToString(variable: documentData["phoneNumber"] as Any)
                userProfile.webSite = unwrapToString(variable: documentData["webSite"] as Any)
            
            
                userProfile.adress.adress = unwrapToString(variable: documentData["adress"] as Any)
                userProfile.adress.country = unwrapToString(variable: documentData["country"] as Any)
                userProfile.adress.city =  unwrapToString(variable: documentData["city"] as Any)
                userProfile.adress.zipCode = unwrapToString(variable: documentData["zipCode"] as Any)
                

                userProfile.paymentDetail.accountName =  unwrapToString(variable: documentData["accountName"] as Any)
                userProfile.paymentDetail.ibanNumber = unwrapToString(variable: documentData["ibanNumber"] as Any)
                userProfile.paymentDetail.accountNumber = unwrapToString(variable: documentData["accountNumber"] as Any)
                userProfile.paymentDetail.bankName = unwrapToString(variable: documentData["bankName"] as Any)
                userProfile.paymentDetail.swiftCode = unwrapToString(variable: documentData["swiftCode"] as Any)
            
                NotificationCenter.default.post(name: Notification.Name("reloadProfile"), object: nil)
                
            }
            
        }
        
    }
    
}

