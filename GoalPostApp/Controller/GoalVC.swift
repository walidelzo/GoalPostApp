//
//  GoalVC.swift
//  GoalPostApp
//
//  Created by Admin on 3/26/19.
//  Copyright © 2019 NanoSoft. All rights reserved.
//

import UIKit

class GoalVC: UIViewController {
    @IBOutlet weak var tableViewGoal: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewGoal.delegate = self
        tableViewGoal.dataSource = self
        tableViewGoal.isHidden = false
        
    }

    @IBAction func AddBTNAction(_ sender: Any) {
        guard let AddGoalVC = storyboard?.instantiateViewController(withIdentifier: "addGoalVC") else {return}
        presentVeiwController(AddGoalVC)
    }
    
}




