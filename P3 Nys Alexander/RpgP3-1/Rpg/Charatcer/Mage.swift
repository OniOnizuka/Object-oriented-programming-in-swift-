//
//  Mage.swift
//  Rpg
//
//  Created by ONIZUKA  on 26/07/2020.
//  Copyright © 2020 ONIZUKA . All rights reserved.
//

import Foundation

class Mage: Characters {
    static let lifepoiont = 50
    static let caNHeal = 25
    // Initializing the feature of the Mage
    init(name:String) {
        super.init(name: name, weapon: MageStick(), lifePoint: Mage.lifepoiont, canHeal: Mage.caNHeal)
    }
    
}
