//
//  Hammer.swift
//  Rpg
//
//  Created by ONIZUKA  on 01/10/2020.
//  Copyright © 2020 ONIZUKA . All rights reserved.
//

import Foundation

class Hammer: Weapon{
    // Initializing the feature of the Bow, how much dammage it can inflict
    static let dammage = 50
    init(){
        super.init(dammages: Hammer.dammage)
    }
}
