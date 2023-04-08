import UIKit
import Fakery
import ParseSwift

// initializing Parse swift
Task {
    do {
        let _ = try await ParseSwift.initialize(applicationId: "Y32c4ltK4bXQum9JAhtF4lNmiWv8Qy6jGTxbpelq", clientKey: "R0ylHbxfi8YdxyhL1eSIJCsnncaVi1giXcSvDWwI", serverURL: URL(string: "https://parseapi.back4app.com")!)
    } catch let error {
        print(error)
    }
}
// initializing faker
let faker = Faker()


var password = "password"

for i in 1...10 {
    var firstName = faker.name.firstName()
    var lastName = faker.name.lastName()
}

