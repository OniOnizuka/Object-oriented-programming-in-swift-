//
//  Archer.swift
//  Rpg
//
//  Created by ONIZUKA  on 26/07/2020.
//  Copyright © 2020 ONIZUKA . All rights reserved.
//

import Foundation

class Archer: Characters {
    static let lifepoint = 60
    static let caNHeal = 10
    // Initializing the feature of the Archer
    init(name:String) {
        super.init(name: name, weapon: Bow(), lifePoint: Archer.lifepoint, canHeal: Archer.caNHeal)
    }
    
}
