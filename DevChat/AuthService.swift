//
//  AuthService.swift
//  DevChat
//
//  Created by Mario Alberto Barragán Espinosa on 10/12/16.
//  Copyright © 2016 mario. All rights reserved.
//

import Foundation
import FirebaseAuth

class AuthService {
    
    private static let _instance = AuthService()
    
    static var instance: AuthService {
        return _instance
    }
    
    func login(email: String, password: String) {
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            
            if error != nil {
                //handle error
            }
        })
    }
    
    func register(email: String, password: String) {
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
            
            if error != nil {
                //handle error
            }
        })
    }
}
