//
//  Characters2HEAL.swift
//  Rpg
//
//  Created by ONIZUKA  on 13/09/2020.
//  Copyright © 2020 ONIZUKA . All rights reserved.
//

import Foundation
/// CharacterType contains the type differents type of Character available in the game
enum characters: Int {
      /// Type of Character available
    case Archer, Warrior, Mage, Dwarf, Knight, DragonSlayer
      
      /// Return the maximum life a Character can have, depending his type
      var lifeMax: Int {
          switch self {
          case .Archer:
              return characters.Archer.lifeMax + 30    // 100
          case .Warrior:
              return characters.Warrior.lifeMax + 45    // 115
          case .Mage:
              return characters.Mage.lifeMax + 15    // 85
          case .Dwarf:
              return characters.Dwarf.lifeMax + 20    // 90
          case .DragonSlayer:
              return characters.DragonSlayer.lifeMax + 15    // 85
          case .Knight:
              return characters.Knight.lifeMax + 10
          }
      }
  }
