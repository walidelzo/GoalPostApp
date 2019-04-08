//
//  FinishGoal.swift
//  GoalPostApp
//
//  Created by Admin on 4/3/19.
//  Copyright © 2019 NanoSoft. All rights reserved.
//

import UIKit

class FinishGoal: UIViewController,UITextFieldDelegate {
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    @IBOutlet weak var goalCompleteNumber: UITextField!
    @IBOutlet weak var createButton: UIButton!
   
    var goalDescription:String!
    var goalType:GoalType!
    
    func initMyVariables(description:String , goalTyp:GoalType){
        self.goalDescription = description
        self.goalType = goalTyp
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createButton?.bindToKeyboard()
        goalCompleteNumber.delegate = self
       let tapGest = UITapGestureRecognizer(target: self, action: #selector(dismissme))
       self.view.addGestureRecognizer(tapGest)
    }
    
    @objc func dismissme(){
        self.view.endEditing(true)
    }
    
   func textFieldDidBeginEditing(_ textField: UITextField) {
        goalCompleteNumber.text = ""
   }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.keyboardType == .numberPad && string != "" {
            let numberStr: String = string
            let formatter: NumberFormatter = NumberFormatter()
            formatter.locale = Locale(identifier: "EN")
            if let final = formatter.number(from: numberStr) {
                textField.text =  "\(textField.text ?? "")\(final)"
            }
            return false
        }
        return true
    }
    
    @IBAction func backBTNPressed(_ sender: Any) {
        dismissViewController(self)
    }
    
    
    @IBAction func createAGoalPressed(_ sender: Any) {
        if (self.goalCompleteNumber.text != ""){
            self.save { (success) in
                self.dismissViewController(self)
            }
        }else {
            print(" empty field")
        }
    }
    
    
    
    //MARK:this function to save Data to CoreData
    func save(compeletion:(_ completion:Bool)->())
    {
        guard  let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        let goal = Goal(context: managedContext)
        
        goal.goalDescription = self.goalDescription
        goal.goalCompletionValue = Int32(self.goalCompleteNumber.text!)!
        goal.goalProgress = 0
        goal.goalType = self.goalType.rawValue
       
        do {
            try managedContext.save()
            compeletion(true)
            print("Success..")
            //let path = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true)
          //  print(path)
        }catch{
            debugPrint("there are an Error\(error.localizedDescription)")
            compeletion(false)
        }
        
        
    }
    
    
}
