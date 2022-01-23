//
//  ViewController.swift
//  Alert
//
//  Created by Beytullah Ozer on 27.09.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordAgainLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordAgainTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func signUpClicked(_ sender: Any) {
        
        /*
        
        let alert = UIAlertController(title: "Error!", message: "Username Not Found!", preferredStyle: UIAlertController.Style.alert)
        self.present(alert, animated: true, completion: nil)
        
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (UIAlertAction ) in
            print("button clicked")
        }
        alert.addAction(okButton)
        
         */
        
        if nameTextField.text == "" {
            //KULLANICI ADI GİRDİĞİNDE SİGN UP'A TIKLARSA HATA MESAJI VERMEYECEK BOŞTA OLDUĞU İÇİN. GİRMEDİĞİNDE TIKLARSA HATA MESAJI VERECEK.
            doAlert(titleInput: "Error!", messageInput: "Name not found.")
        } else if surnameTextField.text == "" {
            doAlert(titleInput: "Error!", messageInput: "Surname not found.")
        } else if passwordTextField.text == "" {
            doAlert(titleInput: "Error!", messageInput: "Password not found.")
        } else if passwordTextField.text != passwordAgainTextField.text {
            doAlert(titleInput: "Error!", messageInput: "Password don't match.")
        } else if emailTextField.text == "" {
            doAlert(titleInput: "Error!", messageInput: "Email not found.")
        } else {
            doAlert(titleInput: "SUCCESS", messageInput: "User was added.")
            print("CONTACTS")
        }
        
        func doAlert (titleInput:String, messageInput:String) {
            let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
        
    }

}
