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
            
            //user freinds
            private var _friendList = [User]()
            
            public init(
                fullname: String = "", emailAddress: String = "", phoneNumber: String = "",
                userName: String = "", password: String = "", pronouns: String = "",
                attractionPreference: String = "", initialRizz: Double = 0.0,
                selfConfidence: Double = 0.0, friendList: [User] = []) {
                _fullname = fullname
                _emailAddress = emailAddress
                _phoneNumber = phoneNumber
                _userName = userName
                _password = password
                _pronouns = pronouns
                _attractionPreference = attractionPreference
                _initialRizz = initialRizz
                _selfConfidence = selfConfidence
                _friendList = friendList
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
            
            public var friendList: [User] {
                get { return _friendList }
                set { _friendList = newValue }
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

    extension User{
        
        static var mockUsers : [User] = [
            User(fullname: "John Smith", emailAddress: "john.smith@example.com", phoneNumber: "555-1234", userName: "jsmith", password: "password", pronouns: "he/him", attractionPreference: "women", initialRizz: 7.5, selfConfidence: 8.0, friendList: []),
            User(fullname: "Jane Doe", emailAddress: "jane.doe@example.com", phoneNumber: "555-5678", userName: "jdoe", password: "password123", pronouns: "she/her", attractionPreference: "men", initialRizz: 9.0, selfConfidence: 7.0, friendList: []),
            User(fullname: "Bob Johnson", emailAddress: "bob.johnson@example.com", phoneNumber: "555-9876", userName: "bjohnson", password: "letmein", pronouns: "they/them", attractionPreference: "non-binary", initialRizz: 5.0, selfConfidence: 5.5, friendList: []),
            User(fullname: "Alice Smith", emailAddress: "alice.smith@example.com", phoneNumber: "555-4321", userName: "asmith", password: "password123", pronouns: "she/her", attractionPreference: "women", initialRizz: 8.0, selfConfidence: 9.5, friendList: []),
            User(fullname: "Samantha Lee", emailAddress: "samanthalee@example.com", phoneNumber: "555-3456", userName: "samanthalee", password: "password", pronouns: "she/her", attractionPreference: "men", initialRizz: 6.5, selfConfidence: 7.5, friendList: []),
            User(fullname: "David Chen", emailAddress: "davidchen@example.com", phoneNumber: "555-7890", userName: "davidchen", password: "password", pronouns: "he/him", attractionPreference: "women", initialRizz: 8.0, selfConfidence: 9.5, friendList: []),
            User(fullname: "Emily Kim", emailAddress: "emilykim@example.com", phoneNumber: "555-2345", userName: "emilykim", password: "password", pronouns: "she/her", attractionPreference: "men", initialRizz: 6.0, selfConfidence: 8.0, friendList: []),
            User(fullname: "Alex Rodriguez", emailAddress: "alexrodriguez@example.com", phoneNumber: "555-6789", userName: "alexrodriguez", password: "password", pronouns: "he/him", attractionPreference: "women", initialRizz: 7.0, selfConfidence: 7.0, friendList: []),
            User(fullname: "Lila Patel", emailAddress: "lilapatel@example.com", phoneNumber: "555-0123", userName: "lilapatel", password: "password", pronouns: "she/her", attractionPreference: "women", initialRizz: 9.0, selfConfidence: 9.0, friendList: []),
            User(fullname: "Maxwell Kim", emailAddress: "maxwellkim@example.com", phoneNumber: "555-4567", userName: "maxwellkim", password: "password", pronouns: "he/him", attractionPreference: "men", initialRizz: 7.5, selfConfidence: 8.5, friendList: [])
        ]
        
        
    }
