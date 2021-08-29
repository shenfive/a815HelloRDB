//
//  Tools.swift
//  a815HelloRDB
//
//  Created by 申潤五 on 2021/8/29.
//

import Foundation
import UIKit
extension UIViewController{
    func showMsg(msg:String){
        let alert = UIAlertController(title: msg, message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "我知道了", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }  
}
