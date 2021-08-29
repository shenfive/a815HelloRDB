//
//  ViewController.swift
//  a815HelloRDB
//
//  Created by 申潤五 on 2021/8/29.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var nickNameTF: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
   
        
    }

    @IBAction func goNextPage(_ sender: Any) {
    }
    
}

