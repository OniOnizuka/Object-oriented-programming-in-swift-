//
//  Characters.swift
//  Rpg
//
//  Created by ONIZUKA  on 26/07/2020.
//  Copyright © 2020 ONIZUKA . All rights reserved.
//

import Foundation
class Characters {
    var name: String 
    var lifePoint: Int
    var weapon : Weapon
    var canHeal : Int
    var roll = BonusWeapon()
    var lifeMaxPoint : Int
    // Used to display the characters features
    var description: String {
        get { let txt = "name: \(self.name) \nlife: \(self.lifePoint) \ndammage of weapon:\(self.weapon.dammages) \ncapacity to heal :\(self.canHeal)"
          return txt
        }
    }
    // Initializing the characters differents feature
    init(name: String ,weapon: Weapon, lifePoint: Int , canHeal: Int) {
        self.name = name
        self.lifePoint = lifePoint
        self.weapon = weapon
        self.canHeal = canHeal
        self.lifeMaxPoint = lifePoint
    }
    // Asking the player if he wants to attack, roll the dice or heal his teammate
    func gamerChoice (gamer:Characters)
    {
        var choice : Int
        var enemyPlayer : Player
        if game.currentPlayer == game.player1.playerNumber {             enemyPlayer = game.player2         }
        else {             enemyPlayer = game.player1         }
        repeat {
            print ("Player, what do you want to do")
            print ("1. Roll the dice and see what you find")
            print ("2. Attack your enemy")
            print ("3. Heal your Team ")
            game.unavailableChoice ()
            choice = game.playerChoiceGlobal
        }
            while choice != 1 && choice != 2 && choice != 3
        if choice == 1 {             self.rollTheDice(character: gamer)         }
        else if choice == 2 {
            print ("player\(game.currentPlayer) choose whom to play against by pressing the number of your choice")
            game.chooseYourCharacter (player: enemyPlayer)
            game.unavailableChoice ()
            self.attack (characters : enemyPlayer.characters [game.playerChoiceGlobal-1])
        }
        else if choice == 3 {
            print("who do you want to heal ?")
            game.healTeam()         }
    }
    // Creating the damages of the weapon
    func receiveDammage (dammage: Int)
    {
        lifePoint = self.lifePoint - dammage
        if self.lifePoint < 0 {             self.lifePoint = 0         }     }
    
    // Putting some hazard into the game
    func rollTheDice (character:Characters)
    {
        roll.russianRoullette (character: character)
        print(character.description)
    }
    // Action to make the attacker play against it's opponent
    func attack (characters:Characters)
    {
        characters.receiveDammage (dammage: self.weapon.dammages)
        print(characters.description)
    }
    // Action to heal your Teammate
    func healTeammate (characters: Characters,canHeal:Int)
    {
        let healingPower = canHeal
        if characters.lifePoint == characters.lifeMaxPoint {
            print("Your character is at his max level")         }
        else {
            characters.lifePoint += healingPower
            if characters.lifePoint > characters.lifeMaxPoint {
                characters.lifePoint = characters.lifeMaxPoint
                print ("Your character is at his max level you are good to go!")
            }
        }
    }
}
