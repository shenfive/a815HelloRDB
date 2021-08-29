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
                self.statusLabel.text = "己登入"
                print(user.uid)
            }else{
                self.statusLabel.text = "己登出"
                print("SignOut")
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "goListPage":
            let nextVC = segue.destination as? Page2ViewController
            nextVC?.nickName = nickNameTF.text ?? ""
        default:
            break
        }
    }
    

    @IBAction func goNextPage(_ sender: Any) {
        let nickName = nickNameTF.text ?? ""
        if nickName.count < 2{
            self.showMsg(msg: "暱稱至少兩碼")
            return
        }
        
        
        if let user = Auth.auth().currentUser {
            self.performSegue(withIdentifier: "goListPage", sender: self)
        }else{
            self.showMsg(msg: "尚未登入")
        }
        
        
        
    }
    
}

