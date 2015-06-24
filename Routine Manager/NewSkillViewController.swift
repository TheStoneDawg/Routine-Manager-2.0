//
//  NewSkillViewController.swift
//  Routine Manager
//
//  Created by Samuel Resendez on 6/20/15.
//  Copyright (c) 2015 Samuel Resendez. All rights reserved.
//

import RealmSwift

class NewSkillViewController: UIViewController {
    //Set by Segue
    var gymnastName = ""
    var routineName = ""
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var eventSegControl: UISegmentedControl!
    @IBOutlet weak var elemGroupSegControl: UISegmentedControl!
    
    
    @IBAction func donePressed(sender: UIBarButtonItem) {
        let newSkill = Skill()
        newSkill.name = nameTextField.text!
        newSkill.value = (valueTextField.text! as NSString).doubleValue
        newSkill.event = eventSegControl.titleForSegmentAtIndex(eventSegControl.selectedSegmentIndex)!
        newSkill.elementGroup = elemGroupSegControl.titleForSegmentAtIndex(elemGroupSegControl.selectedSegmentIndex)!
        newSkill.searchableName = (nameTextField!.text!).lowercaseString
        Realm().write {
            Realm().add(newSkill)
        }
        //self.navigationController?.popViewControllerAnimated(true)
    }
    

}
