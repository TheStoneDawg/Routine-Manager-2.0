//
//  Gymnast.swift
//  Routine Manager
//
//  Created by Samuel Resendez on 6/17/15.
//  Copyright (c) 2015 Samuel Resendez. All rights reserved.
//

import RealmSwift

class Gymnast: Object {
    dynamic var name = ""
    let routines = List<Routine>()
    


}
