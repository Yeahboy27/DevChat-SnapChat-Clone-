//
//  DataService.swift
//  DevChat
//
//  Created by Mario Alberto Barragán Espinosa on 12/12/16.
//  Copyright © 2016 mario. All rights reserved.
//

import Foundation
import FirebaseDatabase

class DataService {
    
    private static let _instance = DataService()
    
    static var instance: DataService {
        return _instance
    }
    
    var mainReference: FIRDatabaseReference {
        return FIRDatabase.database().reference()
    }
    
    func saveUser(uid: String, profile: [String : Any]) {
        mainReference.child("users").child(uid).child("profile").setValue(profile)
    }
    
}
