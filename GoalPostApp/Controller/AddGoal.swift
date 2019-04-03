//
//  AddGoal.swift
//  GoalPostApp
//
//  Created by Admin on 3/31/19.
//  Copyright © 2019 NanoSoft. All rights reserved.
//

import UIKit

class AddGoal: UIViewController {

    @IBOutlet weak var goalTxt: UITextView!
    @IBOutlet weak var longTermBTN: UIButton!
    @IBOutlet weak var shortTermBTN: UIButton!
    @IBOutlet weak var goalTextView: UITextView!
    
    @IBOutlet weak var nextBtn: UIButton!
    var goalType: GoalType = .shortTerm
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nextBtn.bindKeyBoard()
        shortTermBTN.setSelect()
        longTermBTN.setDeselect()
        goalType = .shortTerm
        let tapGest = UITapGestureRecognizer(target: self, action: #selector(dismissKeyBoard))
        self.goalTextView.addGestureRecognizer(tapGest)
    }

    //tapGesturerecogonizer method
    @objc func dismissKeyBoard(){
        self.goalTextView.endEditing(true)
    }
    

    
    
    //MARK:-IBACtions
    
    @IBAction func longTermBtnPressed(_ sender: Any) {
        longTermBTN.setSelect()
        shortTermBTN.setDeselect()
        goalType = .longTerm
    }
    
    @IBAction func shortTermBTNPressed(_ sender: Any) {
        shortTermBTN.setSelect()
        longTermBTN.setDeselect()
        goalType = .shortTerm
    }
    
    @IBAction func nextBTNAction(_ sender: Any) {
    
    }
    
    @IBAction func backBTNActon(_ sender: Any)
    {
        guard let goalsVC = storyboard?.instantiateViewController(withIdentifier: "goalsVC") else {return}
        dismissViewController(goalsVC)
        
    }
}
