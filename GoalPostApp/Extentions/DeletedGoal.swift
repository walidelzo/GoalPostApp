//
//  DeletedGoals.swift
//  GoalPostApp
//
//  Created by Admin on 4/8/19.
//  Copyright © 2019 NanoSoft. All rights reserved.
//

import Foundation

class DeletedGoal{
    
   var goalDescription : String
   private (set) public var goalType:GoalType
   private (set) public var goalComplete:Int32
   private (set) public var goalProgress:Int32
    
    init(inpGoalDiscription:String, inpGoalType:GoalType, inpGoalComlete:Int32,inpGoalProgress:Int32 ) {
        self.goalDescription = inpGoalDiscription
        self.goalType = inpGoalType
        self.goalComplete = inpGoalComlete
        self.goalProgress = inpGoalProgress
    }
}
