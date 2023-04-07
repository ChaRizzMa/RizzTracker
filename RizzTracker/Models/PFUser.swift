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
    // Additional properties required by the ParseUser protocol
    var authData: [String : [String : String]?]?
    var originalData: Data?
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    
    // Main properties linked to the user's information
    var username: String?
    var email: String?
    var emailVerified: Bool?
    var password: String?
    
    // A custom property
    
    var firstName, lastName, phoneNumber: String?
    var currentRizz: Float?
    var friendsList: [String]?
    var pronouns, attractionPreference: String?
    var initialRizz, selfConfidence: Float?
}
