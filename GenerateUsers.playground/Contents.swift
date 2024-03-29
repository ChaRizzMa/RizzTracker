import UIKit
import Fakery
import ParseSwift

// initializing Parse swift

Task {
    do {
        let _ = try await ParseSwift.initialize(applicationId: "hdpLpS4REN8HrhG3MU15508CrEfE1pUKZyM97nwL", clientKey: "FPvX5tKdKwcc4VdlRaQdDu4Nf5jvW2fFBbVF6ALb", serverURL: URL(string: "https://parseapi.back4app.com")!)
    } catch let error {
        print(error)
    }
}
// initializing faker
let faker = Faker()


var password = "password"

var usersArray: [PFUser] = []

for _ in 1...10 {
    var firstName = faker.name.firstName()
    var lastName = faker.name.lastName()
    
    var username = firstName + lastName
    var emailAddress = username + "@email.com"
    
    var selfRizz = Int.random(in: 1...10)
    var selfPerception = Int.random(in: 1...10)
    
    var initialRizz = selfPerception
    var currentRizz = Calculation.calculateInitialRizz(selfRizz: Float(selfRizz), selfPerception: Float(selfPerception))
    var phoneNumber = faker.phoneNumber.cellPhone()
    var friendsList: [String] = []
    
    var gender = faker.gender.type()
    var pronouns = ""
    
    var allAttractionPreferences = ["He/Him", "She/Her", "They/Them"]
    
    if gender == "Male" {
        pronouns = "He/Him"
    } else if gender == "Female" {
        pronouns = "She/Hers"
    } else {
        pronouns = "They/Them"
    }
    
    var newUser = PFUser(username: username, email: emailAddress, password: password, firstName: firstName, lastName: lastName, phoneNumber: phoneNumber, currentRizz: currentRizz, friendsList: friendsList, pronouns: pronouns, attractionPreference: allAttractionPreferences[Int.random(in: 0...allAttractionPreferences.count-1)], initialRizz: Float(initialRizz), selfConfidence: Float(selfPerception))

    
//    newUser.signup { result in
//
//        switch result {
//        case .success(let user):
//            print("✅ Successfully signed up user \(user.username)")
//        case .failure(let error):
//            // Failed sign up
//            print("ERROR!", error.message)
//            print(newUser)
//        }
//    }
    print(newUser)
    usersArray.append(newUser)
}

for user in usersArray {
    // for each user this forloop will loop for how many rizzults they will make
    for _ in 1...Int.random(in: 2...7) {
        
        var newRizzult = Rizzults(
            owner: user.username,
            ownerUUID: user.objectId,
            ownerRizz: Int(user.currentRizz ?? -1),
            badsQuantity: Int.random(in: 5...25),
            wantMeFrFRQuantity: Int.random(in: 5...25),
            goingToTalkToQuantity: Int.random(in: 5...10),
            howManyTalkedTo: Int.random(in: 5...10),
            numberComunications: Int.random(in: 5...10),
            descriptionOfSituation: "Fake Data only for test"
        )
        
        print(newRizzult.owner ?? "-1")

//        newRizzult.save {
//            result in
//                switch result {
//                case .success(_):
//                    print("✅ Parse Object SAVED!")
//                    usleep(200000)
//                case .failure(let error):
//                    assertionFailure("Error saving: \(error)")
//                }
//        }
    }
    
}
