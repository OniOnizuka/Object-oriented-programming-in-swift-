//
//  Team.swift
//  Rpg
//
//  Created by ONIZUKA  on 11/08/2020.
//  Copyright © 2020 ONIZUKA . All rights reserved.
//

import Foundation


class Team{
    var name = String()
    
    // Creating the teams names by asking the players to give a name for their teams and knowing which team is undergoing the action ex: Team1 or Team2
    func createTeam(playerNumber:Int) {
        print("Chose the name of your Team: Team\(playerNumber)")
        name = readLine()!
        
        
    }
    
    
    
}
