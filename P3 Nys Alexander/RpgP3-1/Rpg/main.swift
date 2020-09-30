//
//  main.swift
//  Rpg
//
//  Created by ONIZUKA  on 26/07/2020.
//  Copyright © 2020 ONIZUKA . All rights reserved.
//

import Foundation


// Inplementing some code to be able to interact with the user meaning the player 
func input() -> String {
    let strData = readLine()
    
    return String(strData!)
    
}


// triggering the game to play
var game = Game()

game.startGame()



