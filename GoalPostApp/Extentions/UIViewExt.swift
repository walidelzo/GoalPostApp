//
//  UIViewExt.swift
//  GoalPostApp
//
//  Created by Admin on 3/31/19.
//  Copyright © 2019 NanoSoft. All rights reserved.
//

import UIKit
extension UIView{
    
    func bindKeyBoard(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardChanged(_:)), name:UIResponder.keyboardDidChangeFrameNotification, object:nil)
        
    }
    
    @objc func keyBoardChanged(_ notifation :NSNotification){
        
        let duration = notifation.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        let curve = (notifation.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt)!
        let framBegin = (notifation.userInfo![UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
        let framEnd = (notifation.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        
        let deltaY = CGFloat( (framEnd?.origin.y)!)  - CGFloat((framBegin?.origin.y)!)
        
        UIView.animate(withDuration: duration, delay: 0.0, options: UIView.AnimationOptions.init(rawValue: curve), animations: {
            self.frame.origin.y += deltaY
        }, completion: nil)
        
        
    }
    
    
}
