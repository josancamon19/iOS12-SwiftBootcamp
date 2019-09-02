//
//  ViewController.swift
//  fbTestApp
//
//  Created by Joan Cabezas on 8/30/19.
//  Copyright © 2019 josancamon19. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI

class ViewController: UIViewController, FUIAuthDelegate {
    
    var db: Firestore? = nil
    var authUI : FUIAuth? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authUI = FUIAuth.defaultAuthUI()
        let providers: [FUIAuthProvider] = [FUIPhoneAuth(authUI: authUI!)]
        authUI?.providers = providers
        authUI?.delegate = self
//        db = Firestore.firestore()
//        var ref: DocumentReference? = nil
//        ref = db?.collection("users").addDocument(data: [
//            "first": "Ada",
//            "last": "Lovelace",
//            "born": 1815
//        ]) { err in
//            if let err = err {
//                print("Error adding document: \(err)")
//            } else {
//                print("Document added with ID: \(ref!.documentID)")
//            }
//        }
    }

    @IBAction func btnSignInPressed(_ sender: UIButton) {
        // to show the ui screen with sign in methods
        // let authViewController = authUI.authViewController()

        let phoneProvider = authUI?.providers.first as! FUIPhoneAuth
        phoneProvider.signIn(withPresenting: self, phoneNumber: nil)
    
    }
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        // if signed in, go to next navigation controller
        print("Received")
        if error != nil{
            // throw dialog
            print(error!.localizedDescription)
            return
        }
        
        if  authDataResult?.additionalUserInfo?.isNewUser == true{
            print("First time user")
            // send data to server
            
        }
        if let user = authDataResult?.user {
            print(String(user.phoneNumber!))
        }
    }
    
}

