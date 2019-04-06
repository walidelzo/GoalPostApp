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
    
    @IBOutlet weak var tableViewGoal: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewGoal.delegate = self
        tableViewGoal.dataSource = self
        tableViewGoal.isHidden = false
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
    
}



extension GoalVC {
    
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




