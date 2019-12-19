//
//  LoginViewController.swift
//  FirebaseWebinar
//
//  Created by Алексей Пархоменко on 15.12.2019.
//  Copyright © 2019 Алексей Пархоменко. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.alpha = 0
        
    }

    @IBAction func loginButtonPressed(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (result, error) in
            if error != nil {
                // error description
                print("some sign in error...") // доделать
            } else {
                print("Jump to the next screen")
            }
        }
    }
    
}
