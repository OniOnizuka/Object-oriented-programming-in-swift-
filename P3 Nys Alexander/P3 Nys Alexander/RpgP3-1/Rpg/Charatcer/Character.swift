//
//  Characters.swift
//  Rpg
//
//  Created by ONIZUKA  on 26/07/2020.
//  Copyright © 2020 ONIZUKA . All rights reserved.
//

import Foundation
class Character{
    let name: String
    var lifePoint: Int
    var weapon : Weapon
    let canHeal : Int
    var roll = BonusWeapon()
    let lifeMaxPoint : Int
    // Used to display the characters features
    var description: String {
        get { let txt = "name: \(self.name) \nlife: \(self.lifePoint) \ndammage of weapon:\(self.weapon.dammages) \ncapacity to heal :\(self.canHeal)"
            return txt
        }
    }
    // Initializing the characters differents feature
    init(name: String ,weapon: Weapon, lifePoint: Int , canHeal: Int){
        self.name = name
        self.lifePoint = lifePoint
        self.weapon = weapon
        self.canHeal = canHeal
        self.lifeMaxPoint = lifePoint
    }
    
    //MARK: - Dice rolling/game hazard
    
    // Putting some hazard into the game
    func rollTheDice (character:Character){
        roll.russianRoullette (character: character)
        print(character.description)
    }
    
    // MARK: - Player action
    
    // Action to make the attacker play against it's opponent
    func attack (characters:Character){
        characters.receiveDammage (dammage: self.weapon.dammages)
        print(characters.description)
    }
    // Creating the damages of the weapon
    func receiveDammage (dammage: Int){
        lifePoint = self.lifePoint - dammage
        if self.lifePoint < 0 {
            self.lifePoint = 0
        }
    }
    // Action to heal your Teammate
    func healTeammate (characters: Character,canHeal:Int){
        let healingPower = canHeal
        if characters.lifePoint == characters.lifeMaxPoint{
            print("Your character is at his max level")
        }
        else {
            characters.lifePoint += healingPower
            if characters.lifePoint > characters.lifeMaxPoint{
                characters.lifePoint = characters.lifeMaxPoint
                print ("Your character is at his max level you are good to go!")
            }
        }
    }
}
