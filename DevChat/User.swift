//
//  User.swift
//  DevChat
//
//  Created by Mario Alberto Barragán Espinosa on 12/12/16.
//  Copyright © 2016 mario. All rights reserved.
//

import UIKit

struct User {
    private var _uid: String
    private var _firstName: String
    private var _lastName: String
    
    var uid: String {
        return _uid
    }
    
    var firstName: String {
        return _firstName
    }
    
    var lastName: String {
        return _lastName
    }
    
    init(uid: String, firstName: String, lastName: String) {
        _uid = uid
        _firstName = firstName
        _lastName = lastName
    }
}
