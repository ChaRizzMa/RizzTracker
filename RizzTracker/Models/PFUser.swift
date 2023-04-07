//
//  UserSignUp.swift
//  RizzTracker
//
//  Created by Vincent Carrancho on 3/9/23.
//

import Foundation
import ParseSwift

enum ValidationError: Error {
    case invalidInput(String)
}

/**
 This class will only be used for the user sign up page.
 TODO: Implement signup method after all the data is not empty.
 TODO: Implement a validation function to make sure none of the data is empty
 */

//Created to utilize the login and signup features from ParseSwift
struct PFUser: ParseUser {
    
    // ParseObject
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var originalData: Data?
    
    // These are required by `ParseUser`.
    var username: String?
    var email: String?
    var emailVerified: Bool?
    var password: String?
    var authData: [String: [String: String]?]?
    
}
