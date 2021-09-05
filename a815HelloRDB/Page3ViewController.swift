//
//  Page3ViewController.swift
//  a815HelloRDB
//
//  Created by 申潤五 on 2021/8/29.
//

import UIKit
import Firebase

class Page3ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    var nickName = ""
    var key = ""
    var subJect = ""
    var dbReference:DatabaseReference!
    var commentArray:[[String:Any]] = []
    
    

    @IBOutlet weak var theTableView: UITableView!
    @IBOutlet weak var inputTextTF: UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()
        print("page3 nickName\(nickName)")
        self.title = subJect
        
        dbReference = Database.database().reference().child("comment").child(key)
        theTableView.delegate = self
        theTableView.dataSource = self
        
        dbReference.observe(.value) { snapshot in
            print("newData")
            
            self.commentArray.removeAll()
            
            for item in snapshot.children{
                if let itemSnapshot = item as? DataSnapshot{
                    let comment = itemSnapshot.childSnapshot(forPath: "comment").value as? String ?? "不清楚"
                    let nickname = itemSnapshot.childSnapshot(forPath: "user").value as? String ?? "不知道"
                    let time:Double = (itemSnapshot.childSnapshot(forPath: "t").value as? Double ?? 0) / 1000
                    
                    let commentDate = Date(timeIntervalSince1970: time)
                    
                    
                    let dateFomater = DateFormatter()
                    dateFomater.dateFormat = "yyyy-MM-dd HH:mm"
                    let dateString = dateFomater.string(from: commentDate)
                
                    let commentContent = ["comment":comment,
                                          "user":nickname,
                                          "t":dateString,
                                          "theTime":time] as [String : Any]
                    
                    self.commentArray.append(commentContent)
                    
                    
                    print("==============")
                    print("\(comment)\n\(nickname)\n\(dateString)")
                }

                self.commentArray.sort { itemA, itemB in
                    return itemA["theTime"] as? Double ?? 0 > itemB["theTime"] as? Double ?? 0
                }
                
                self.theTableView.reloadData()
                
                
                
                
            }
            
            
            
            
        }
        
    }
    
    
    @IBAction func newComment(_ sender: Any) {
        let comment = inputTextTF.text ?? ""
        
        if comment.count < 1 {
            showMsg(msg: "至少寫個字")
            return
        }
        
        let commentRef = dbReference.childByAutoId()
        
        let commentContent = ["comment":comment,
                              "user":nickName,
                              "t":ServerValue.timestamp()] as [String : Any]
        
        commentRef.setValue(commentContent)
        inputTextTF.text = ""
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentTableViewCell") as! CommentTableViewCell
        
//        cell.backgroundColor = UIColor.yellow
        cell.comment.text = commentArray[indexPath.row]["comment"] as! String
        cell.nickname.text = commentArray[indexPath.row]["user"] as! String
        cell.date.text = commentArray[indexPath.row]["t"] as! String
        
        
        return cell
    }
    
    
    
    

}
