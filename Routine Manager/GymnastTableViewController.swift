//
//  GymnastTableViewController.swift
//  Routine Manager
//
//  Created by Samuel Resendez on 6/17/15.
//  Copyright (c) 2015 Samuel Resendez. All rights reserved.
//


import RealmSwift

class GymnastTableViewController: UITableViewController {
    
    
    override func viewDidAppear(animated: Bool) {
        self.tableView.reloadData()
        
    }
  
        //Complete!
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let gymnasts = Realm().objects(Gymnast)
        return gymnasts.count
    }
    //Complete!
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("gymnastcellIdentifier") as! UITableViewCell
        let gymnast = Realm().objects(Gymnast)[indexPath.row]
        cell.textLabel!.text = gymnast.name
        return cell
    }
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            var gymnastName = (self.tableView.cellForRowAtIndexPath(indexPath))?.textLabel?.text
            let gymnast = Realm().objects(Gymnast).filter("name = %@",gymnastName!)
            Realm().write {
                Realm().delete(gymnast)
        }
        self.tableView.reloadData()
    }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let dest = segue.destinationViewController as? RoutineTableViewController {
            let cell = sender as! UITableViewCell
            dest.gymnastName = cell.textLabel!.text!
        }
    }

}
