//
//  SkillTableViewController.swift
//  Routine Manager
//
//  Created by Samuel Resendez on 6/20/15.
//  Copyright (c) 2015 Samuel Resendez. All rights reserved.
//

import RealmSwift

class SkillTableViewController: UITableViewController {
    
////////Should be set by Segue
    var routineName = ""
    var gymnastName = ""
////////////////////////////////////////////////////
    
    
    override func viewDidAppear(animated: Bool) {
        println(routineName)
        println(gymnastName)
        self.tableView.reloadData()
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let routine = Realm().objects(Routine).filter("name = %@ AND gymnastName = %@", routineName, gymnastName).first
        return routine!.skills.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("skillCellIdentifier") as! UITableViewCell
        cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "skillCellIdentifier")
        let routine = Realm().objects(Routine).filter("name = %@ AND gymnastName = %@", routineName, gymnastName).first
        cell.textLabel!.text = routine!.skills[indexPath.row].name
        cell.detailTextLabel!.text = "\(routine!.skills[indexPath.row].value)"
        return cell
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let dest = segue.destinationViewController as? SelectedSkillTableViewController {
            dest.gymnastName = gymnastName
            dest.routineName = routineName
        }
    }

}
