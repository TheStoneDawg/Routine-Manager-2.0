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
        
        var start = 10.0
        
        var isI = false
        var isII = false
        var isIII = false
        var isIV = false
        var isV = false
        
        for skill in skills {
            start += skill.value
            switch skill.elementGroup {
            case "I":
                if (!isI) {
                    start += 0.5
                }
                isI = true
            case "II":
                if (!isII) {
                    start += 0.5
                    isII = true
                }
                
            case "III":
                if (!isIII) {
                    start += 0.5
                    isIII = true
                }
                
            case "IV":
                if (!isIV){
                    start += 0.5
                    isIV = true
                }
            case "V":
                if (!isV) {
                    start += 0.5
                    isV = true
                }
            default:
                start += 0.0
                println("something went wrong with elementGroup addition to startValue")
                
            }
            
        }

        return start
    }
    dynamic var event = ""
    let skills = List<Skill>()
}
