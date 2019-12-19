//
//  SignInViewController.swift
//  FirebaseWebinar
//
//  Created by Алексей Пархоменко on 15.12.2019.
//  Copyright © 2019 Алексей Пархоменко. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase


class SignInViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.alpha = 0

        // Do any additional setup after loading the view.
    }
    
    func checkValid() -> String? {
        if firstNameTextField.text == "" ||
            lastNameTextField.text == "" ||
            emailTextField.text == "" ||
            passwordTextField.text == "" ||
            firstNameTextField.text == nil ||
            lastNameTextField.text == nil ||
            emailTextField.text == nil ||
            passwordTextField.text == nil {
            
            return "Please fill in all fiels"
        }
        
        return nil
    }
    

    @IBAction func signInPressed(_ sender: Any) {
        let error = checkValid()
        
        if error != nil {
            errorLabel.alpha = 1
            errorLabel.text = error
        } else {
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (result, error) in
                if error != nil {
                    self.errorLabel.text = "\(error?.localizedDescription)"
                } else {
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: [
                        "firstname": self.firstNameTextField.text!,
                        "lastname": self.lastNameTextField.text!,
                        "uid": result!.user.uid
                    ]) { (error) in
                        if error != nil {
                            self.errorLabel.text = "Error saving user in database"
                        }
                        print(result!.user.uid)
                    }
                    
                    
                    print("Jump to the next screen")
                }
            }
        } // else
    }
}
