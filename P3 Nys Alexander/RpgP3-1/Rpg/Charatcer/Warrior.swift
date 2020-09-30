//
//  Warrior.swift
//  Rpg
//
//  Created by ONIZUKA  on 26/07/2020.
//  Copyright © 2020 ONIZUKA . All rights reserved.
//

import Foundation

class Warrior : Characters {
    static let lifepoint = 100
    static let caNHeal = 20
    // Initializing the feature of the Warrior
    init(name:String) {
        super.init(name: name, weapon: Sword(), lifePoint: Warrior.lifepoint, canHeal: Warrior.caNHeal)
    }
    
}
