//
//  RegisterVC.swift
//  DevChat
//
//  Created by Mario Alberto Barragán Espinosa on 11/12/16.
//  Copyright © 2016 mario. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {

    @IBOutlet weak var emailField: RoundTextField!
    @IBOutlet weak var passwordField: RoundTextField!
    @IBOutlet weak var firstNameField: RoundTextField!
    @IBOutlet weak var lastNameField: RoundTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func registerPressed(_ sender: RoundedButton) {
        
        let profile = ["firstName" : firstNameField.text,
                       "lastName" : lastNameField.text]
        
        if let email = emailField.text, let pass = passwordField.text , (email.characters.count > 0 && pass.characters.count > 0) {
            
            AuthService.instance.register(email: email, password: pass, profile: profile, onComplete: { (errorMessage, data) in
                guard errorMessage == nil else {
                    let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    return
                }
                self.dismiss(animated: true, completion: nil)
            })
            
        } else {
            let alert = UIAlertController(title: "Username and password required", message: "You must enter both username and a password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
}
