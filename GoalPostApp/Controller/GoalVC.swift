//
//  GoalVC.swift
//  GoalPostApp
//
//  Created by Admin on 3/26/19.
//  Copyright © 2019 NanoSoft. All rights reserved.
//

import UIKit
import CoreData
class GoalVC: UIViewController {
    var goals:[Goal] = []
    var goalsUndo:[DeletedGoal] = []
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    @IBOutlet weak var undoView: UIView!
    
    @IBOutlet weak var tableViewGoal: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewGoal.delegate = self
        tableViewGoal.dataSource = self
        tableViewGoal.isHidden = false
        undoView.isHidden = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchFromCoreData()
    }
    
    func fetchFromCoreData(){
        self.fetch { (success) in
            if goals.count >= 1{
                tableViewGoal.isHidden = false
                tableViewGoal.reloadData()
            }else{
                tableViewGoal.isHidden = true
            }
        }
    }
    
    
    @IBAction func AddBTNAction(_ sender: Any) {
        guard let AddGoalVC = storyboard?.instantiateViewController(withIdentifier: "addGoalVC") else {return}
        presentVeiwController(AddGoalVC)
    }
    
    /////
    @IBAction func UndoButton(_ sender: UIButton)
    {
       undoDelteGoal()
        
    }
    
    
    ///Undo function
    
    func undoDelteGoal(){
        //goals.append(goalsUndo[0])
        print(" the undo array count \(self.goalsUndo.count)")
        print("the goals array count is \(self.goals.count)")
        guard let contextManager = self.appDelegate?.persistentContainer.viewContext else {return}
        let goal = Goal(context: contextManager)
        
        let thisDeletedGoal = self.goalsUndo.last
        
        goal.goalDescription = thisDeletedGoal?.goalDescription
        goal.goalType = thisDeletedGoal?.goalType.rawValue
        goal.goalProgress = thisDeletedGoal!.goalProgress
        goal.goalCompletionValue = thisDeletedGoal!.goalComplete
        
        do {
            try contextManager.save()
            print("the data was saved ..")
        } catch{
            debugPrint("the error occured \(error.localizedDescription)")
        }
        
        self.fetchFromCoreData()
        self.undoView.isHidden = true
        
        
    }
    
}



extension GoalVC {
    func setProgress(AtIndexPath:IndexPath)
    {
        guard let contextManager  = self.appDelegate?.persistentContainer.viewContext else {return}
        let chosenGoal = goals[AtIndexPath.row]
        if chosenGoal.goalProgress < chosenGoal.goalCompletionValue
        {
            chosenGoal.goalProgress += 1
        }else{return}
        
        do {
            try contextManager.save()
        }
        catch
        {
            debugPrint("An Error Occured \(error.localizedDescription)")
        }
        
    }
    
    func DeleteData(AtIndexPath:IndexPath){
        guard let contextManager = self.appDelegate?.persistentContainer.viewContext else {return}

        contextManager.delete(goals[AtIndexPath.row])
       
        do {
            try contextManager.save()
            print("the data was saved ..")
        } catch{
            debugPrint("the error occured \(error.localizedDescription)")
        }
        
        
    }
    
    func fetch(completion:(_ complete:Bool)->())
    {
        guard let context = UIApplication.shared.delegate as? AppDelegate else {return}
        let fetch = NSFetchRequest<Goal>(entityName: "Goal")
        
        do
        {
            try goals = context.persistentContainer.viewContext.fetch(fetch)
            completion(true)
            print("the count of  data \(goals.count)")
        }
        catch {
            debugPrint("the error occured \(error.localizedDescription)")
            completion(false)
        }
        
        
        
    }
    
    
}




