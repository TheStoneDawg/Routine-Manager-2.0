//
//  Skill.swift
//  Routine Manager
//
//  Created by Samuel Resendez on 6/17/15.
//  Copyright (c) 2015 Samuel Resendez. All rights reserved.
//

import RealmSwift

class Skill: Object {
    
    dynamic var name = ""
    dynamic var value = 0.0
    dynamic var event = ""
    dynamic var elementGroup = ""
    //workaround since computedProperties are not being persisted
    dynamic var searchableName = ""
   }
