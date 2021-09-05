//
//  Page3ViewController.swift
//  a815HelloRDB
//
//  Created by 申潤五 on 2021/8/29.
//

import UIKit
import Firebase

class Page3ViewController: UIViewController {
    
    var nickName = ""
    var key = ""
    var subJect = ""
    var dbReference:DatabaseReference!

    @IBOutlet weak var inputTextTF: UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()
        print("page3 nickName\(nickName)")
        self.title = subJect
        
        dbReference = Database.database().reference().child("comment").child(key)
        
        
    }
    
    
    @IBAction func newComment(_ sender: Any) {
        let comment = inputTextTF.text ?? ""
        
        if comment.count < 1 {
            showMsg(msg: "至少寫個字")
            return
        }
        
        let commentRef = dbReference.childByAutoId()
        
        let commentContent = ["commnet":comment,
                              "user":nickName,
                              "t":ServerValue.timestamp()] as [String : Any]
        
        commentRef.setValue(commentContent)
        inputTextTF.text = ""
        
    }
    
    
    
    

}
