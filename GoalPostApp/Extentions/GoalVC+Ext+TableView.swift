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
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell", for: indexPath) as? GoalCell else {return UITableViewCell()}
        cell.configureCell(goal: "read some Swift 5 Book.", Type: .shortTerm, progress: "14")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}
