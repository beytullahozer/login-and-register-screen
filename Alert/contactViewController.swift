//
//  contactViewController.swift
//  contactViewController
//
//  Created by Beytullah Ozer on 27.09.2021.
//

import UIKit

class contactViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    
    @IBAction func addMemberClicked(_ sender: Any) {
        
        if nameLabel.text == "" {
            addMemberClicked(nameLabel.text as Any)
        } else if surnameLabel.text == "" {
            addMemberClicked(surnameLabel.text as Any)
        } else if emailLabel.text == "" {
            addMemberClicked(emailLabel.text as Any)
        }
        
    }
}
