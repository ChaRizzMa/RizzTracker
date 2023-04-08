//
//  Math.swift
//  RizzTracker
//
//  Created by Vincent Carrancho on 4/8/23.
//

import Foundation

struct Calculation {
    
    static func calculateInitialRizz(selfRizz: Float, selfPerception: Float) -> Float {
        return 0.2 + 0.06 * ((selfRizz/2) + (selfPerception/2))
    }
    
    // TODO: Refine this formula
    static func calculateRizz(quantities: [Int], weights: [Float], previousRizz: Int) -> Float {
        if quantities.count != weights.count {
            return -1
        }
        
        var deltaRizz: Float = 0.0
        for i in 0..<quantities.count {
            deltaRizz += weights[i] * Float(quantities[i])
        }
        
        deltaRizz = 10 + log10(abs(deltaRizz - 10))
        
        return Float(previousRizz) + deltaRizz
    }
}
