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
import GoogleSignIn

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var loginGoogle: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.alpha = 0
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        GIDSignIn.sharedInstance()?.delegate = self
    }

    @IBAction func loginButtonPressed(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (result, error) in
            if error != nil {
                // error description
                print("some sign in error...") // доделать
            } else {
                print("Jump to the next screen")
            }
            print(result?.user.photoURL ?? "no photo")
        }
    }
    
    @IBAction func loginGooglePressed(_ sender: Any) {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.signIn()
    }
    
    
}

//extension LoginViewController: GIDSignInDelegate {
//    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
//        if let _ = error {
//            print("Error 1")
//            return
//        }
//
//        guard let auth = user.authentication else { return }
//        let credential = GoogleAuthProvider.credential(withIDToken: auth.idToken, accessToken: auth.accessToken)
//
//        Auth.auth().signIn(with: credential) { (result, error) in
//            if let _ = error {
//                print("Error 2")
//                return
//            }
//            print("123")
//            guard let uid = result?.user.uid else { return }
//            guard let email = result?.user.email else { return }
//            guard let username = result?.user.displayName else { return }
//            print(username)
//            let values = ["email": email, "username": username]
////            Database.database().reference().child(uid).updateChildValues(<#T##values: [AnyHashable : Any]##[AnyHashable : Any]#>)
//        }
//    }
//
//
//}
