//
//  FinishGoal.swift
//  GoalPostApp
//
//  Created by Admin on 4/3/19.
//  Copyright © 2019 NanoSoft. All rights reserved.
//

import UIKit

class FinishGoal: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var goalCompleteNumber: UITextField!
    @IBOutlet weak var createButton: UIButton!
    
    @IBOutlet weak var ViewBtn: UIView!
    var goalDescription:String!
    var goalType:GoalType!
    
    func initMyVariables(description:String , goalTyp:GoalType){
        self.goalDescription = description
        self.goalType = goalTyp
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createButton.bindKeyBoard()
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        goalCompleteNumber.text = ""
    }
    
    @IBAction func backBTNPressed(_ sender: Any) {
        dismissViewController(self)
    }
    
    
    @IBAction func createAGoalPressed(_ sender: Any) {
    }
}
