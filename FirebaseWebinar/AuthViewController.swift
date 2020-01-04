//
//  AuthViewController.swift
//  FirebaseWebinar
//
//  Created by Алексей Пархоменко on 15.12.2019.
//  Copyright © 2019 Алексей Пархоменко. All rights reserved.
//

import UIKit
import GoogleSignIn
import FirebaseAuth
import Firebase

class AuthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
GIDSignIn.sharedInstance()?.delegate = self
    }

    @IBAction func signInPressed(_ sender: Any) {
    }
    
    @IBAction func loginPressed(_ sender: Any) {
    }
    
}

extension AuthViewController: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let _ = error {
            print("Error 1")
            return
        }
        
        guard let auth = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: auth.idToken, accessToken: auth.accessToken)
        
        Auth.auth().signIn(with: credential) { (result, error) in
            if let _ = error {
                print("Error 2")
                return
            }
            print("123")
            guard let uid = result?.user.uid else { return }
            guard let email = result?.user.email else { return }
            guard let username = result?.user.displayName else { return }
            
            print(username)
            let values = ["email": email, "username": username]
//            Database.database().reference().child(uid).updateChildValues(<#T##values: [AnyHashable : Any]##[AnyHashable : Any]#>)
            
            guard let photo = result?.user.photoURL else { return }
            print(photo)
        }
    }
    
    
}
