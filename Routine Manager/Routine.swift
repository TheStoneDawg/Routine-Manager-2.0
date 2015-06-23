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
    var startValue: Double {
        var start = 0.0
        for skill in skills {
            start += skill.value
        }
        return start
    }
    dynamic var event = ""
    let skills = List<Skill>()
}
