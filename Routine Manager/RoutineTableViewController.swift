//
//  RoutineTableViewController.swift
//  
//
//  Created by Samuel Resendez on 6/19/15.
//
//

import RealmSwift

class RoutineTableViewController: UITableViewController {
    //Set by Segue
    var gymnastName = ""
    
    override func viewDidAppear(animated: Bool) {
        self.tableView.reloadData()
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let gymnast = Realm().objects(Gymnast).filter("name = %@",gymnastName).first
        return gymnast!.routines.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("routineCellIdentifier") as! UITableViewCell
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "routineCellIdentifier")
        let gymnast = Realm().objects(Gymnast).filter("name = %@",gymnastName).first
        cell.textLabel!.text = gymnast?.routines[indexPath.row].name
        cell.detailTextLabel!.text = "\(gymnast!.routines[indexPath.row].startValue)"
        
        return cell
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let dest = segue.destinationViewController as? NewRoutineViewController {
            dest.gymnastName = gymnastName
        }
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("This Method is in fact called")
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

}