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
    private var _fullname: String
    private var _emailAddress: String
    private var _phoneNumber: String
    private var _userName: String
    private var _password: String
    
    // about yourself
    private var _pronouns: String
    private var _attractionPreference: String
    private var _initialRizz: Double
    private var _selfConfidence: Double
    
    //user freinds
    private var _friendList = [User]()
    
    public init(
        fullname: String = "",
        emailAddress: String = "",
        phoneNumber: String = "",
        userName: String = "",
        password: String = "",
        pronouns: String = "",
        attractionPreference: String = "",
        initialRizz: Double = 0.0,
        selfConfidence: Double = 0.0,
        friendList: [User] = []
    ) {
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
        get { _fullname }
        set { _fullname = newValue }
    }
    
    public var emailAddress: String {
        get { _emailAddress }
        set { _emailAddress = newValue }
    }
    
    public var phoneNumber: String {
        get { _phoneNumber }
        set { _phoneNumber = newValue }
    }
    
    public var userName: String {
        get { _userName }
        set { _userName = newValue }
    }
    
    public var password: String {
        get { _password }
        set { _password = newValue }
    }
    
    // about yourself
    public var pronouns: String {
        get { _pronouns }
        set { _pronouns = newValue }
    }
    
    public var attractionPreference: String {
        get { _attractionPreference }
        set { _attractionPreference = newValue }
    }
    
    public var friendList: [User] {
        get { _friendList }
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

//Mock users start here.
extension User {
    static var mockUsers: [User] = [
        User(fullname: "John Smith",
             emailAddress: "john.smith@example.com",
             phoneNumber: "555-1234",
             userName: "jsmith",
             password: "password",
             pronouns: "he/him",
             attractionPreference: "women",
             initialRizz: 7.5,
             selfConfidence: 8.0,
             friendList: []),
        User(fullname: "Jane Doe",
             emailAddress: "jane.doe@example.com",
             phoneNumber: "555-5678",
             userName: "jdoe",
             password: "password123",
             pronouns: "she/her",
             attractionPreference: "men",
             initialRizz: 9.0,
             selfConfidence: 7.0,
             friendList: []),
        User(fullname: "Bob Johnson",
             emailAddress: "bob.johnson@example.com",
             phoneNumber: "555-9876",
             userName: "bjohnson",
             password: "letmein",
             pronouns: "they/them",
             attractionPreference: "non-binary",
             initialRizz: 5.0,
             selfConfidence: 5.5,
             friendList: []),
        User(fullname: "Alice Smith",
             emailAddress: "alice.smith@example.com",
             phoneNumber: "555-4321",
             userName: "asmith",
             password: "password123",
             pronouns: "she/her",
             attractionPreference: "women",
             initialRizz: 8.0,
             selfConfidence: 9.5,
             friendList: [])
    ]
}