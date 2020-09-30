//
//  Axe.swift
//  Rpg
//
//  Created by ONIZUKA  on 11/08/2020.
//  Copyright © 2020 ONIZUKA . All rights reserved.
//

import Foundation

class Axe: Weapon {
    // Initializing the feature of the Axe, how much dammage it can inflict
static let dammage = 14
    init() {
        super.init(dammages: Axe.dammage)
    }
}
