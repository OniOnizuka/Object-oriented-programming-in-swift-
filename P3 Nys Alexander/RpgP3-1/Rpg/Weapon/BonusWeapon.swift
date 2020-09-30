//
//  Bonus.swift
//  Rpg
//
//  Created by ONIZUKA  on 27/08/2020.
//  Copyright © 2020 ONIZUKA . All rights reserved.
//

import Foundation
class BonusWeapon {

    // Putting a little hazard into the game by making the player chose if he wants to play so maybe he can find a stronger weapon that could inflict stronger dammage
    func russianRoullette(character:Characters) {
        let diceRoll = Int(arc4random_uniform(10))

        // 3 = 40% of chance for an empty chest (array count 0 to 9).
        if diceRoll > 3 {
            character.weapon.dammages += 25
            print("You got more power added to your weapon !")
        } else {
            print("Sorry nothing for you , keep playing !")
        }
    }
}
