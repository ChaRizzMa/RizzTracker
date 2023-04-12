//
//  Rizzsults.swift
//  RizzTracker
//
//  Created by Vincent Carrancho on 4/8/23.
//

import Foundation
import ParseSwift

struct Rizzults: ParseObject {
    
    // Parse data
    var originalData: Data?
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseSwift.ParseACL?
    
    // report metadata
    var owner: String? // username
    var objectID: String? // owner uuid
    var ownerRizz: Int? // the current rizz of the owner of the report
    
    // What we will see in report
    var badsQuantity: Int? // quantity of damn he/she/they bad
    var wantMeFrFRQuantity: Int? // quantity of he/she/they want me frfr
    var goingToTalkToQuantity: Int? // quantity of im gunna talk to him/her/them
    var howManyTalkedTo: Int? // quantity of how many guys/girls/folk talked to
    var numberComunications: Int? // quantity of numbers gotten
    var descriptionOfSituation: String?
    
}
