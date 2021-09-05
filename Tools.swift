//
//  Tools.swift
//  a815HelloRDB
//
//  Created by 申潤五 on 2021/8/29.
//

import Foundation
import UIKit
extension UIViewController{
    func showMsg(msg:String,title:String=""){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "我知道了", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
    func showIndicator(){
        let bgView = UIView(frame: self.view.bounds)
        bgView.backgroundColor = UIColor.black
        bgView.alpha = 0.5
        bgView.accessibilityIdentifier = "TheIndeView"
        
        let idicatorView = UIActivityIndicatorView(style: .large)
        idicatorView.color = UIColor.white
        idicatorView.center = self.view.center
        idicatorView.startAnimating()
        bgView.addSubview(idicatorView)
        self.view.addSubview(bgView)
    
    }
    
    func removeIndicator(){
        for theView in self.view.subviews{
            if theView.accessibilityIdentifier == "TheIndeView"{
                theView.removeFromSuperview()
            }
        }
        
        
    }
    
    
    
    
}
extension String{
    func localize() -> String{
        return NSLocalizedString(self, comment: "")
    }
}

