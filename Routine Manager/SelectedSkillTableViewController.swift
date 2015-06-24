//
//  SelectedSkillTableViewController.swift
//  Routine Manager
//
//  Created by Samuel Resendez on 6/20/15.
//  Copyright (c) 2015 Samuel Resendez. All rights reserved.
//

import RealmSwift
import UIKit


class SelectedSkillTableViewController: UITableViewController, UISearchResultsUpdating {
    //Set by Segue
    var gymnastName = ""
    var routineName = ""
    
    //Other vars
    var searchController = UISearchController()
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        self.tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        self.searchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
            
            self.tableView.tableHeaderView = controller.searchBar
            return controller
        })()
    }

    

    override func viewDidAppear(animated: Bool) {
        self.tableView.reloadData()
    }
    //IT WORKS OHMYGOSH
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (self.searchController.active) {
            let routine = Realm().objects(Routine).filter("name = %@ AND gymnastName = %@", routineName, gymnastName).first
            let skills = Realm().objects(Skill).filter("event = %@ AND searchableName CONTAINS %@",routine!.event,self.searchController.searchBar.text.lowercaseString)
            return skills.count
        }
        else {
            let routine = Realm().objects(Routine).filter("name = %@ AND gymnastName = %@", routineName, gymnastName).first
            let skills = Realm().objects(Skill).filter("event = %@",routine!.event)
            return skills.count
        }
    }
    //YEAAAAAAHHHHH
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if (self.searchController.active) {
            var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("selSkillIdentifier") as! UITableViewCell
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "selSkillIdentifier")
            let routine = Realm().objects(Routine).filter("name = %@ AND gymnastName = %@",routineName,gymnastName).first
            var searchString = (self.searchController.searchBar.text).lowercaseString
            let filteredSkills = Realm().objects(Skill).filter("event = %@ AND searchableName CONTAINS %@",routine!.event,searchString)
            cell.textLabel!.text = filteredSkills[indexPath.row].name
            cell.detailTextLabel!.text = "\(filteredSkills[indexPath.row].value)"
            
            return cell
            
        }
        
        else {
            var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("selSkillIdentifier") as! UITableViewCell
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "selSkillIdentifier")
        
        
            let routine = Realm().objects(Routine).filter("name = %@ AND gymnastName = %@",routineName,gymnastName).first
            let skills = Realm().objects(Skill).filter("event = %@",routine!.event)
            cell.textLabel!.text = skills[indexPath.row].name
            cell.detailTextLabel!.text = "\(skills[indexPath.row].value)"
            return cell
        }
    }
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            let routine = Realm().objects(Routine).filter("name = %@ AND gymnastName = %@", routineName, gymnastName).first
            let skills = Realm().objects(Skill).filter("event = %@ AND name = %@",routine!.event, (self.tableView.cellForRowAtIndexPath(indexPath))!.textLabel!.text!)
            Realm().write {
                Realm().delete(skills)
            }
            self.tableView.reloadData()
        }
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
        self.view.makeToast("\(skill!.name) successfully added!", duration: 1.0, position: CSToastPositionCenter)
    }
}

