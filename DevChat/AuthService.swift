//
//  AuthService.swift
//  DevChat
//
//  Created by Mario Alberto Barragán Espinosa on 10/12/16.
//  Copyright © 2016 mario. All rights reserved.
//

import Foundation
import FirebaseAuth

typealias Completion = (_ errMsg: String?, _ data: Any?) -> Void

class AuthService {
    
    private static let _instance = AuthService()
    
    static var instance: AuthService {
        return _instance
    }
    
    func login(email: String, password: String, onComplete: Completion?) {
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            
            if error != nil {
                self.handelFirebaseError(error: error!, onComplete: onComplete)
            } else {
                onComplete?(nil, user)
            }
        })
    }
    
    func register(email: String, password: String, onComplete: Completion?) {
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
            
            if error != nil {
                self.handelFirebaseError(error: error!, onComplete: onComplete)
            } else {
                onComplete?(nil, user)
            }
        })
    }
    
    func handelFirebaseError(error: Error, onComplete: Completion?) {
        print(error.localizedDescription)
        
        if let errorCode = FIRAuthErrorCode(rawValue: error._code) {
            
            switch errorCode {
            case .errorCodeInvalidEmail:
                onComplete?("Invalid email",nil)
                break
            case .errorCodeWrongPassword:
                onComplete?("Wrong Password",nil)
                break
            case .errorCodeEmailAlreadyInUse, .errorCodeAccountExistsWithDifferentCredential:
                onComplete?("Email already in use",nil)
            default:
                onComplete?("There was a problem try again",nil)
            }
        }
        
        
        
    }
}
