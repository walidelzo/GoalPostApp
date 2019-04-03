//
//  Ext+UiviewController.swift
//  GoalPostApp
//
//  Created by Admin on 3/31/19.
//  Copyright © 2019 NanoSoft. All rights reserved.
//

import UIKit

extension UIViewController{
    
    func  presentVeiwController (_ uiViewController: UIViewController){
        let transtion = CATransition()
        transtion.duration = 0.4
        transtion.type = .reveal
        transtion.subtype = .fromRight
        self.view.window?.layer.add(transtion, forKey: kCATransition)
        present(uiViewController, animated: false, completion: nil)
    }
    
    func dismissViewController(_ uiViewController: UIViewController){
        let transtion = CATransition()
        transtion.duration = 0.4
        transtion.type = .reveal
        transtion.subtype = .fromLeft
        self.view.window?.layer.add(transtion, forKey: kCATransition)
        dismiss(animated: false, completion: nil)
    }
}
