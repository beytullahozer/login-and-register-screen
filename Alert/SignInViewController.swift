//
//  SignInViewController.swift
//  SignInViewController
//
//  Created by Beytullah Ozer on 29.09.2021.
//

import UIKit

class SignInViewController: UIViewController {
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signInClicked(_ sender: Any) {
        
        print("sign in clicked")
        if nameTextField.text == "" {
            doAlert(titleInput: "Error!", messageInput: "Name not found.")
        } else if passwordTextField.text == "" {
            doAlert(titleInput: "Error!", messageInput: "Password not found.")
        } else {
            print("Login Successfully.")
        }
        
        func doAlert (titleInput:String, messageInput:String) {
            let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
        
        
    }
    
    
    @IBAction func registerNewAccountClicked(_ sender: Any) {
        
        print("register new account clicked")
        
    }
    


}
