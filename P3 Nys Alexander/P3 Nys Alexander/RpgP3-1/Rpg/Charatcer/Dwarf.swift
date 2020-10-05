//
//  Dwarf.swift
//  Rpg
//
//  Created by ONIZUKA  on 11/08/2020.
//  Copyright © 2020 ONIZUKA . All rights reserved.
//

import Foundation

class Dwarf: Character{
    static let lifepoint = 80
    static let caNHeal = 15
    // Initializing the feature of the Dwarf
    init(name:String){
        super.init(name: name, weapon: Axe(), lifePoint: Dwarf.lifepoint, canHeal: Dwarf.caNHeal)
    }
    
}
