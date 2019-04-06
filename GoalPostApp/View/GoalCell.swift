//
//  GoalCell.swift
//  GoalPostApp
//
//  Created by Admin on 3/27/19.
//  Copyright © 2019 NanoSoft. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

    @IBOutlet weak var goalLabel: UILabel!
    
    @IBOutlet weak var goalType: UILabel!
    
    @IBOutlet weak var progressLbl: UILabel!
    
    func configureCell(goal:Goal){
        goalLabel.text = goal.goalDescription
        goalType.text = goal.goalType
        progressLbl.text = String( goal.goalProgress)
        
    }
}
