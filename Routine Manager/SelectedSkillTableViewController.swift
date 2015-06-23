//
//  SelectedSkillTableViewController.swift
//  Routine Manager
//
//  Created by Samuel Resendez on 6/20/15.
//  Copyright (c) 2015 Samuel Resendez. All rights reserved.
//

import RealmSwift
import UIKit


class SelectedSkillTableViewController: UITableViewController {
    //Set by Segue
    var gymnastName = ""
    var routineName = ""
    
    //Other vars
    
    

    override func viewDidAppear(animated: Bool) {
        self.tableView.reloadData()
        println(gymnastName)
        println(routineName)
    }
    //IT WORKS OHMYGOSH
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let routine = Realm().objects(Routine).filter("name = %@ AND gymnastName = %@", routineName, gymnastName).first
        let skills = Realm().objects(Skill).filter("event = %@",routine!.event)
        return skills.count
    }
    //YEAAAAAAHHHHH
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("selSkillIdentifier") as! UITableViewCell
        cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "selSkillIdentifier")
        
        
        let routine = Realm().objects(Routine).filter("name = %@ AND gymnastName = %@",routineName,gymnastName).first
        let skills = Realm().objects(Skill).filter("event = %@",routine!.event)
        cell.textLabel!.text = skills[indexPath.row].name
        cell.detailTextLabel!.text = "\(skills[indexPath.row].value)"
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let dest = segue.destinationViewController as? NewSkillViewController {
            dest.gymnastName = gymnastName
            dest.routineName = routineName
        }
    }
    
    
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: false)
        var cell = tableView.cellForRowAtIndexPath(indexPath)
        let routine = Realm().objects(Routine).filter("name = %@ AND gymnastName = %@", routineName, gymnastName).first
        let skill = Realm().objects(Skill).filter("name = %@ AND event = %@",cell!.textLabel!.text!,routine!.event).first
        Realm().write{
            routine!.skills.append(skill!)
        }
        self.view.makeToast("\(skill!.name) successfully added!", duration: 1.0, position: CSToastPositionTop)
    }
}

