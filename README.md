# ChaRizzMa (Charisma)

## Table of Contents

1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)

## Overview

### Description

Tracks the users rizz and puts it into a social media like feed. The app has the potential to better the rizz of the user by visualizing the growth or lack therof in a very easy to use app.

### App Evaluation

- **Category:** Leaderboard / Dating App
- **Mobile:** This app is soley used on mobile because it was designed to be used whilst being out in social situations and being readily accesssible.
- **Story:** Analyzes users' rizz and makes them become better.
- **Market:** Any individual could choose to use this app, and to keep it a safe environment, we will have to anonymize all user data.
- **Habit:** This app could be used as often or unoften as the user wanted depending on how deep their social life is, and what exactly they're looking for.
- **Scope:** Since this app is a lifestyle app that has the potential to track the user's rizz, it has the potential to improve the user's rizz by help the user see the progress they have over time. Additionally this rizz tracking has teh potential to be integrated into existing dating apps such as Tinder or Bumble, maybe it can be integrated into dating coach apps also!

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

- Users must be able to input their friend's rizz stats and affect the user's rizz overall.
- Ability to include notes when rating friends.
- Leaderboard showing the person with the highest score.

**Optional Nice-to-have Stories**

- A Spotify-like wrapped weekly summary of the user's rizz stats.
- Change in rizz per week.
- Groups to rate your friends.
- Create line graph that shows rizz over time

### 2. Screen Archetypes

- Login Screen
  - User can log in
- Create Account Screen
  - User can create a new account with initial rizz stats.
- My Rizz Page
  - Summary of your rizz stats.
- Add Rizz Page
  - A page in which you can report your friend's rizz.
- Rizz Feed

### 3. Navigation

**Tab Navigation** (Tab to Screen)

- Rizz Feed
- Add Rizz
- My Rizz

**Flow Navigation** (Screen to Screen)

- Login Screen => Home
- Login Screen => Create Account => Home
- Rizz Feed => Rizz Detail Page or Modal
- My Rizz => Settings/Logout

## Wireframes

<img src="https://github.com/VincentCarrancho/RizzTracker/blob/main/rizz%20low%20fidelity.jpg" width=600>

## Schema

[This section will be completed in Unit 9]

### Models

- PFUser Model
  This model was created to utilize features from ParseSwift

| Property             | Type     | Description                                                               |
| -------------------- | -------- | ------------------------------------------------------------------------- |
| authData             | String   | String for authentication data for parse swift user                       |
| originalData         | Data     | Data for when user is created                                             |
| objectId             | String   | String for id of user                                                     |
| createdAt            | Date     | Date for when user is created at                                          |
| updatedAt            | Date     | Date for when user is updated at                                          |
| ACL                  | ParseACL | used to control which users can access or modify a particular ParseObject |
| username             | String   | String for user's username                                                |
| email                | String   | String for user's email                                                   |
| emailVerified        | Bool     | Boolean to check if email has been used before                            |
| password             | String   | String for user's password                                                |
| firstName            | String   | String for user's first name                                              |
| lastName             | String   | String for user's last name                                               |
| phoneNumber          | String   | String for user's phone number                                            |
| currentRizz          | Float    | Float for user's current rizz                                             |
| friendsList          | String   | String to represent friend's list                                         |
| pronouns             | String   | String for user's pronouns                                                |
| attractionPreference | String   | String for user's attraction preference (pronouns)                        |
| initialRizz          | Float    | Float for initial rizz selected when creating account                     |
| selfConfidence       | Float    | Float for self confidence selected when creating account                  |
| rizzReports          | String   | String for rizz reports                                                   |

- Rizzults Model

| Property               | Type   | Description                                |
| ---------------------- | ------ | ------------------------------------------ |
| owner                  | String | String of username                         |
| ownerUUID              | String | String of owner ID                         |
| ownerRizz              | Int    | Current rizz of the owner of the report    |
| badsQuantity           | Int    | Int of "damn he/she/them bad"              |
| wantMeFrFRQuantity     | Int    | Int of "of he/she/them want me frfr"       |
| goingToTalkToQuantity  | Int    | Int of "I'm going to talk to him/her/them" |
| howManyTalkedTo        | Int    | Int of how many people spoken to           |
| numberCommunications   | Int    | Int of numbers gotten                      |
| descriptionOfSituation | String | String description of the situation        |

### Networking

#### Login/Signup Networking

GET request to get the user information on log in button tap .

```swift
@IBAction func onLoginButtonTap(_ sender: Any) {
        // if correct credentials login:
        // performSegue(withIdentifier: "Homepage", sender: sender)
        // else: perform error handling

        guard let username = UsernameField.text,
              let password = PasswordField.text,
              !username.isEmpty,
              !password.isEmpty else {

            showMissingFieldsAlert()
            return
        }

        // Log in the parse user
        PFUser.login(username: username, password: password) { [weak self] result in

            switch result {
            case .success(let PFUser):
                print("✅ Successfully logged in as user: \(String(describing: PFUser.username))")

                // Post a notification that the user has successfully logged in.
                NotificationCenter.default.post(name: Notification.Name("login"), object: nil)

            case .failure(let error):
                self?.showAlert(description: error.localizedDescription)
            }
        }

    }
```

POST request in order to sign up a new user into the database.

```swift
func createUser() {
        var newUser = PFUser(username: username, email: email, password: password)
        newUser.firstName = fn
        newUser.lastName = ln
        newUser.phoneNumber = pn
        newUser.currentRizz = 0.0 // TODO: Change this to the formula
        newUser.friendsList = []
        newUser.pronouns = pronouns
        newUser.attractionPreference = attractionpreference
        newUser.initialRizz = selfRizz
        newUser.selfConfidence = selfAttraction


        newUser.signup { [weak self] result in

            switch result {
            case .success(let user):

                print("✅ Successfully signed up user \(user)")

                // Post a notification that the user has successfully signed up.
                NotificationCenter.default.post(name: Notification.Name("login"), object: nil)

            case .failure(let error):
                // Failed sign up
                print(error.message)
                self?.showAlert(description: error.message)
            }
        }

    }
```

#### Homepage View Controller

GET request to get all of the Rizzults from the Rizzults class in Back4App.

```swift
private func fetchData() {
    Task {
        do {
            let data = try await query.findAll()
            DispatchQueue.main.async {
                self.rizzults = data
                self.rizzults = self.rizzults.sorted(by: { $0.updatedAt ?? Date.distantPast > $1.updatedAt ?? Date.distantPast })
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
            }
        } catch let error {
            print("Error: ❌", error)
            self.refreshControl.endRefreshing()
        }
    }
}
```

#### Add Rizz View Controller

POST request in order to create a new Rizzult in the database.

```swift
@IBAction func onSubmit(_ sender: Any) {

    //Calc Rizz, idk what im doing LOL
    let a =  Double(question1Field.text!)!
    let b =  Double(question2Field.text!)!
    let c =  Double(question3Field.text!)!
    let d =  Double(question4Field.text!)!
    let e =  Double(question5Field.text!)!

    // Some math here

    let newRizzult = Rizzults(
        owner: user?.username,
        ownerUUID: user?.objectId,
        ownerRizz: Int(overall),
        badsQuantity: Int(question1Field.text ?? "0"),
        wantMeFrFRQuantity: Int(question2Field.text ?? "0"),
        goingToTalkToQuantity: Int(question3Field.text ?? "0"),
        howManyTalkedTo: Int(question4Field.text ?? "0"),
        numberComunications: Int(question5Field.text ?? "0"),
        descriptionOfSituation: question6Field.text ?? "Null"
    )

    newRizzult.save {
        result in
            switch result {
            case .success(_):
                print("✅ Parse Object SAVED!")
            case .failure(let error):
                assertionFailure("Error saving: \(error)")
            }
    }
    user?.currentRizz = Float(overall)
    user?.save {
        result in
            switch result {
            case .success(_):
                print("✅ User Rizz updated")
            case .failure(let error):
                assertionFailure("Error saving: \(error)")
            }
    }
    resetFourm()
}
```

PUT request to update user's overall rizz

```swift
user?.currentRizz = Float(overall)
user?.save {
    result in
        switch result {
        case .success(_):
            print("✅ User Rizz updated")
        case .failure(let error):
            assertionFailure("Error saving: \(error)")
    }
}
```

#### My Rizz View Controller

GET request in order to get the user's own rizzults.

```swift
private func getData() {
    var pronoun1 = ""
    var pronoun2 = ""
    var pronoun3 = ""

    //var sheBad, sheWant, toTalk, womanTalked, numGot: Int

    Task {
        do {
            user = try await PFUser.current()
            print(user as Any)
            print("My Rizz: ✅", user ?? "")

            let query = Rizzults.query("ownerUUID" == user?.objectId)
            var rizzults: [Rizzults] = []
            var damnBads = 0.0
            var wantMefrfr = 0.0
            var goingToTalk = 0.0
            var talkedTo = 0.0
            var numsGotten = 0.0

            let data = try await query.findAll()
            DispatchQueue.main.async {
                rizzults = data
                rizzults = rizzults.sorted(by: { $0.updatedAt ?? Date.distantPast > $1.updatedAt ?? Date.distantPast })
            }

            print("Data Size: ", data.count)

            // Math and Label assignments
        } catch let error {
            print("An error occurred: \(error)")
        }
    }
    // Do any additional setup after loading the view.
}
```

## Video Walkthrough

Here's a walkthrough of implemented user stories:

Create Account Flow

![gif walkthrough](https://github.com/ChaRizzMa/RizzTracker/blob/main/Create%20Account%20Flow.gif)

Login Flow

![gif walkthrough](https://github.com/ChaRizzMa/RizzTracker/blob/main/Login%20Flow.gif)

Add Rizz Flow

![gif walkthrough](https://github.com/ChaRizzMa/RizzTracker/blob/main/Add%20Rizz.gif)

My Rizz Flow

![gif walkthrough](https://github.com/ChaRizzMa/RizzTracker/blob/main/My%20Rizz.gif)
