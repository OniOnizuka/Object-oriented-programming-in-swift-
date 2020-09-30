//
//  Sword.swift
//  Rpg
//
//  Created by ONIZUKA  on 26/07/2020.
//  Copyright © 2020 ONIZUKA . All rights reserved.
//

import Foundation

class Sword: Weapon {
    // Initializing the feature of the Sword
static let dammage = 15
    init(){
        super.init(dammages: Sword.dammage)
    }
}
