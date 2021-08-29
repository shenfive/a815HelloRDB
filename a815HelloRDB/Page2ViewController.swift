//
//  Page2ViewController.swift
//  a815HelloRDB
//
//  Created by 申潤五 on 2021/8/29.
//

import UIKit
import Firebase

class Page2ViewController: UIViewController {

    var nickName = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(nickName)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let ref = Database.database().reference().child("forum")
        ref.observeSingleEvent(of: .value) { snapshot in
            print(snapshot)
        }
        
    }

}
