//
//  MageStick.swift
//  Rpg
//
//  Created by ONIZUKA  on 26/07/2020.
//  Copyright © 2020 ONIZUKA . All rights reserved.
//

import Foundation

class MageStick: Weapon {
    // Initializing the feature of the Magestick, how much dammage it can inflict
static let dammage = 13
    init(){
        super.init(dammages: MageStick.dammage)
    }
}
