    //
    //  GoalVC+Ext.swift
    //  GoalPostApp
    //
    //  Created by Admin on 3/27/19.
    //  Copyright © 2019 NanoSoft. All rights reserved.
    //

    import UIKit

    extension GoalVC:UITableViewDelegate,UITableViewDataSource{
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           // print(goals.count)
            return goals.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell", for: indexPath) as? GoalCell else {return UITableViewCell()}
            let goal = goals[indexPath.row]
            cell.configureCell(goal: goal)
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print(indexPath.row)
        }
        
        func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
           return true
        }
        func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
            return .none
        }
        
        func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
            let deletaAction = UITableViewRowAction (style: .destructive, title: "DELETE") { (rowAction, indexPath) in
                let delete = self.goals[indexPath.row]
                let deletedGoal :DeletedGoal = DeletedGoal(inpGoalDiscription: delete.goalDescription!, inpGoalType: GoalType(rawValue: delete.goalType!)!, inpGoalComlete: delete.goalCompletionValue, inpGoalProgress: delete.goalProgress)
                self.goalsUndo.append(deletedGoal)
                self.DeleteData(AtIndexPath: indexPath)
                self.fetchFromCoreData()
                self.undoView.isHidden = false
            }
            let AddAction = UITableViewRowAction(style: .destructive, title: "ADD 1") { (dAction, indexPath) in
                self.setProgress(AtIndexPath: indexPath)
                tableView.reloadRows(at: [indexPath], with: .automatic)
            }
            deletaAction.backgroundColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
            AddAction.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
            var rowActions:[UITableViewRowAction] = []
            if goals[indexPath.row].goalCompletionValue > goals[indexPath.row].goalProgress{
                rowActions = [deletaAction , AddAction]
            }else {
                rowActions =  [deletaAction]
            }
            return rowActions
        }
        
        
        
        
    }
