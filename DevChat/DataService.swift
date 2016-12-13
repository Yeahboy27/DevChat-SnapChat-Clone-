//
//  DataService.swift
//  DevChat
//
//  Created by Mario Alberto Barragán Espinosa on 12/12/16.
//  Copyright © 2016 mario. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage

class DataService {
    
    private static let _instance = DataService()
    
    static var instance: DataService {
        return _instance
    }
    
    var mainReference: FIRDatabaseReference {
        return FIRDatabase.database().reference()
    }
    
    var usersReference: FIRDatabaseReference {
        return mainReference.child(FIR_CHILD_USERS)
    }
    
    var mainStorageReference: FIRStorageReference {
        return FIRStorage.storage().reference()
    }
    
    var videoStorageReference: FIRStorageReference {
        return mainStorageReference.child("videos")
    }
    
    func saveUser(uid: String, profile: [String : Any]) {
        mainReference.child(FIR_CHILD_USERS).child(uid).child(FIR_CHILD_PROFILE).setValue(profile)
    }
    
}
