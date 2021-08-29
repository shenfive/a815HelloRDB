//
//  ViewController.swift
//  a815HelloRDB
//
//  Created by 申潤五 on 2021/8/29.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    var dbRef:DatabaseReference!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dbRef = Database.database().reference()
        
        Auth.auth().signInAnonymously(completion: nil)
        Auth.auth().addStateDidChangeListener { auth, user in
            if let user = user{
                print("SingIned")
                print(user.uid)
            }else{
                print("SignOut")
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let theRef = dbRef.child("appdefult").child("myFirstWrite")
        theRef.setValue("Hello Data")

        
    }


}

