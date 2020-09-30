//
//  Spear.swift
//  Rpg
//
//  Created by ONIZUKA  on 11/08/2020.
//  Copyright © 2020 ONIZUKA . All rights reserved.
//

import Foundation

class Spear: Weapon {
    // Initializing the feature of the Spear, how much dammage it can inflict
static let dammage = 12
    init() {
        super.init(dammages: Spear.dammage)
    }
}
