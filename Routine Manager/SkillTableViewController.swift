//
//  SkillTableViewController.swift
//  Routine Manager
//
//  Created by Samuel Resendez on 6/17/15.
//  Copyright (c) 2015 Samuel Resendez. All rights reserved.
//

import RealmSwift

class SkillTableViewController: UITableViewController {
    
    /////////////////////////////////////////////////////
    var gymnast = ""
    var routineName = ""
    //////////////////////////////////////////////////////
    
        override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let routine = Realm().objects(Routine).first
            println(routine)
        return routine!.skills.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("skillReuseIdentifier") as! UITableViewCell
        var routine = Realm().objects(Routine).filter("gymnastName = %@ AND name = %@",gymnast, routineName).first
        cell.textLabel!.text = routine!.skills[indexPath.row].name
        
        return cell
    }
}
