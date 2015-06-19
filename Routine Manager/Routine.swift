//
//  Routine.swift
//  Routine Manager
//
//  Created by Samuel Resendez on 6/17/15.
//  Copyright (c) 2015 Samuel Resendez. All rights reserved.
//


import RealmSwift

class Routine: Object {
    dynamic var gymnastName = ""
    dynamic var name = ""
    dynamic var startValue = 0.0
    dynamic var event = ""
    let skills = List<Skill>()
}
