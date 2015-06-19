//
//  NewGymnastViewController.swift
//  Routine Manager
//
//  Created by Samuel Resendez on 6/17/15.
//  Copyright (c) 2015 Samuel Resendez. All rights reserved.
//

import RealmSwift

class NewGymnastViewController: UIViewController {
       
    @IBOutlet weak var nameTextField: UITextField!
    
    
    @IBAction func donePressed(sender: UIBarButtonItem) {
        let gymnast = Gymnast()
        gymnast.name = nameTextField.text
        Realm().write{
            Realm().add(gymnast)
        }
        self.navigationController?.popViewControllerAnimated(false)
    }

}
