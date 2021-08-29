//
//  Page2ViewController.swift
//  a815HelloRDB
//
//  Created by 申潤五 on 2021/8/29.
//

import UIKit
import Firebase

class Page2ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "goPage3":
            let nextVC = segue.destination as? Page3ViewController
            nextVC?.nickName = self.nickName
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "goPage3", sender: self)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subject.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = subject[indexPath.row]
        return cell
    }
    

    var nickName = ""
    var keys:[String] = []
    var subject:[String] = []
    
    @IBOutlet weak var theTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(nickName)
        theTableView.dataSource = self
        theTableView.delegate = self
        
        self.title = "討論區例表"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        
        
        let ref = Database.database().reference().child("forum")
        ref.observe( .value) { snapshot in
            self.keys.removeAll()
            self.subject.removeAll()
            for item in snapshot.children{

                if let itemSnapshot = item as? DataSnapshot{
                    let theSubject = itemSnapshot.childSnapshot(forPath: "subject").value as! String
                    self.subject.append(theSubject)
                    let key = itemSnapshot.key
                    self.keys.append(key)
                }
            }
            self.theTableView.reloadData()
            
            
        }
        
    }

}
