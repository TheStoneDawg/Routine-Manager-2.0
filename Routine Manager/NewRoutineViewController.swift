//
//  NewRoutineViewController.swift
//  Routine Manager
//
//  Created by Samuel Resendez on 6/17/15.
//  Copyright (c) 2015 Samuel Resendez. All rights reserved.
//

import RealmSwift

class NewRoutineViewController: UIViewController {
    //Should be set by segue
    var gymnastName = ""
    
    
    override func viewDidAppear(animated: Bool) {
        println(gymnastName)
    }
    
    
    @IBOutlet weak var eventSegControl: UISegmentedControl!
    @IBOutlet weak var nameTextField: UITextField!
    
    
    @IBAction func donePressed(sender: UIBarButtonItem) {
        let newRoutine = Routine()
        newRoutine.event = eventSegControl.titleForSegmentAtIndex(eventSegControl.selectedSegmentIndex)!
        newRoutine.name = nameTextField.text!
        newRoutine.gymnastName = gymnastName
        let gymnast = Realm().objects(Gymnast).filter("name = %@",gymnastName).first
        Realm().write {
            gymnast!.routines.append(newRoutine)
        }
        self.navigationController?.popViewControllerAnimated(false)
    }
}
