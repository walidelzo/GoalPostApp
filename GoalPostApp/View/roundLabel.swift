//
//  roundLabel.swift
//  GoalPostApp
//
//  Created by Admin on 3/27/19.
//  Copyright © 2019 NanoSoft. All rights reserved.
//

import UIKit

@IBDesignable
class roundLabel: UILabel {
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setUp()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
    }
    
    func setUp(){
    layer.cornerRadius = bounds.width / 2
    layer.backgroundColor = #colorLiteral(red: 0.08235294118, green: 0.5098039216, blue: 0.7921568627, alpha: 1)
    textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
}
