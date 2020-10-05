//
//  HealTeamMate.swift
//  Rpg
//
//  Created by ONIZUKA  on 14/09/2020.
//  Copyright © 2020 ONIZUKA . All rights reserved.
//

import Foundation
 
enum CharacterType: Int {
/// Type of Character available
    case Archer, Warrior, Mage, Dwarf, Knight,DragonSlayer

/// Return the maximum life a Character can have, depending his type
var life: Int {
   
    switch self {
    case .Archer:
        return life + 20
    case .Warrior:
        return life +  25
    case .Mage:
        return life + 30
    case .Dwarf:
        return life + 10
    case .Knight:
        return life + 15
    case .DragonSlayer:
        return life + 5
        }
    }
}
