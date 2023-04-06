//
//  UserSignUp.swift
//  RizzTracker
//
//  Created by Vincent Carrancho on 3/9/23.
//

import Foundation

enum ValidationError: Error {
    case invalidInput(String)
}

/**
 This class will only be used for the user sign up page.
 TODO: Implement signup method after all the data is not empty.
 TODO: Implement a validation function to make sure none of the data is empty
 */
public class User {
    // contact information
    private var _fullname, _emailAddress, _phoneNumber, _userName, _password: String
    
    // about yourself
    private var _pronouns, _attractionPreference: String
    private var _initialRizz, _selfConfidence: Double
    
    public init(fullname: String = "", emailAddress: String = "", phoneNumber: String = "", userName: String = "", password: String = "",
                pronouns: String = "", attractionPreference: String = "", initialRizz: Double = 0.0, selfConfidence: Double = 0.0) {
        _fullname = fullname
        _emailAddress = emailAddress
        _phoneNumber = phoneNumber
        _userName = userName
        _password = password
        _pronouns = pronouns
        _attractionPreference = attractionPreference
        _initialRizz = initialRizz
        _selfConfidence = selfConfidence
    }
    
    // contact information
    public var fullname: String {
        get { return _fullname }
        set { _fullname = newValue }
    }
    
    public var emailAddress: String {
        get { return _emailAddress }
        set { _emailAddress = newValue }
    }
    
    public var phoneNumber: String {
        get { return _phoneNumber }
        set { _phoneNumber = newValue }
    }
    
    public var userName: String {
        get { return _userName }
        set { _userName = newValue }
    }
    
    public var password: String {
        get { return _password }
        set { _password = newValue }
    }
    
    // about yourself
    public var pronouns: String {
        get { return _pronouns }
        set { _pronouns = newValue }
    }
    
    public var attractionPreference: String {
        get { return _attractionPreference }
        set { _attractionPreference = newValue }
    }
    
    func setInitialRizz(_ value: Double) throws {
        guard value >= 0 && value <= 10 else {
            throw ValidationError.invalidInput("Initial Rizz value must be between 0 and 10")
        }
        _initialRizz = value
    }
    
    func setSelfConfidence(_ value: Double) throws {
        guard value >= 0 && value <= 10 else {
            throw ValidationError.invalidInput("Self confidence value must be between 0 and 10")
        }
        _selfConfidence = value
    }
    
}
