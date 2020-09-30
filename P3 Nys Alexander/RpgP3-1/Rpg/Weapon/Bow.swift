//
//  Bow.swift
//  Rpg
//
//  Created by ONIZUKA  on 26/07/2020.
//  Copyright © 2020 ONIZUKA . All rights reserved.
//

import Foundation

class Bow: Weapon {
    // Initializing the feature of the Bow, how much dammage it can inflict
static let dammage = 12
    init() {
        super.init(dammages: Bow.dammage)
    }
}
