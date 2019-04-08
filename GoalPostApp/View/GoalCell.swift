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
    
    @IBOutlet weak var completeView: UIView!
    func configureCell(goal:Goal){
        goalLabel.text = goal.goalDescription
        goalType.text = goal.goalType
        progressLbl.text = String( goal.goalProgress)
        
        if goal.goalProgress >= goal.goalCompletionValue{
            self.completeView.isHidden = false
        }else{
            self.completeView.isHidden = true
        }
        
    }
}
