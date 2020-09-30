//
//  Knight.swift
//  Rpg
//
//  Created by ONIZUKA  on 11/08/2020.
//  Copyright © 2020 ONIZUKA . All rights reserved.
//

import Foundation

class Knight: Characters {
    static let lifepoint = 70
    static let caNHeal = 5
    // Initializing the feature of the Knight
    init(name:String) {
        super.init(name: name, weapon: Spear(), lifePoint: Knight.lifepoint, canHeal: Knight.caNHeal)
    }
    
}
