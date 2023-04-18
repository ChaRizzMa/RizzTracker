import UIKit
import ParseSwift

Task {
    do {
        let _ = try await ParseSwift.initialize(applicationId: "hdpLpS4REN8HrhG3MU15508CrEfE1pUKZyM97nwL", clientKey: "FPvX5tKdKwcc4VdlRaQdDu4Nf5jvW2fFBbVF6ALb", serverURL: URL(string: "https://parseapi.back4app.com")!)
    } catch let error {
        print(error)
    }
}

let query = Rizzults.query("ownerUUID" == "ZnZxlRG3KO")
var rizzults: [Rizzults] = []
var damnBads = 0.0
var wantMefrfr = 0.0
var goingToTalk = 0.0
var talkedTo = 0.0
var numsGotten = 0.0

Task {
    do {
        let data = try await query.findAll()
        DispatchQueue.main.async {
            rizzults = data
            rizzults = rizzults.sorted(by: { $0.updatedAt ?? Date.distantPast > $1.updatedAt ?? Date.distantPast })
        }
        print("Data Size: ", data.count)
        
        if (data.count >= 1) {
            for r in data {
                damnBads += Double(r.badsQuantity!)
                wantMefrfr += Double(r.wantMeFrFRQuantity!)
                goingToTalk += Double(r.goingToTalkToQuantity!)
                talkedTo += Double(r.howManyTalkedTo!)
                numsGotten += Double(r.numberComunications!)
            }
        } else {
            // user has no rizzults
        }
        print(damnBads)
        
        print("Bads", damnBads/Double(data.count))
        print("Want Me", wantMefrfr/Double(data.count))
        print("Ima Talk To", goingToTalk/Double(data.count))
        print("Talked TO", talkedTo/Double(data.count))
        print("Numbers Gotten", numsGotten/Double(data.count))
        
    } catch let error {
        print("Error: ❌", error)
    }
}

