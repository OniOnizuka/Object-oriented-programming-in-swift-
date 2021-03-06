//
//  Player.swift
//  Rpg
//
//  Created by ONIZUKA  on 29/07/2020.
//  Copyright © 2020 ONIZUKA . All rights reserved.
//

import Foundation
var charactersNames:[String] = []

class Player{
    var choice: Int = 0
    var characters:[Character] = []
    var arrayDead = [Character]()
    var playerNumber:Int
    var team = Team()
    // Making sure to always know which player is playing ex: player1 or player2
    init (playerNumber:Int){
        self.playerNumber = playerNumber
    }
    
    //MARK: - Creating the team names
    
    // Creating the teams names by asking the players to give a name for their teams
    func createTeamName(){
        team.createTeam (playerNumber: self.playerNumber)
        chooseTeamCharacters ()
    }
    
    //MARK: - Listing the dead players
    
    // Browsing through the characters list to see if the lives are =O so that we can find out who is dead.
    func playerIsDead()->Bool{
        for Character in characters {
            if  Character.lifePoint > 0{
                return (false)
            }
        }
        return (true)
    }
    
    //MARK: - Unique name to everyone
    
    // Creating a unique name for each Character
    func ifNameExiste(name: String)->Bool{
        var answer = false
        if charactersNames.contains(name){
            answer = false
        } else {
            answer = true
        }
        return answer
    }
    // Creating a unique name for each Character
    func uniqueName(index: Int)->String{
        var answer = String ()
        var choice = index
        let nameYourType : [String] = [
            "Choose the name for your Mage ?",
            "Choose the name for your Archer?",
            "Choose the name for your Warrior?",
            "Choose the name for your Dwarf ?",
            "Choose the name for your Knight?",
            "Choose the name for your DragonSlayer"
        ]
        var denomination = true
        while denomination == true {
            if choice < 7 {
                print (nameYourType[choice - 1])
                if let name = readLine (){
                    let testName = ifNameExiste (name: name)
                    if testName == true {
                        answer = name
                        denomination = false
                    }
                    else {
                        print ("This name has already been chosen , try a new one !")
                        denomination = true
                    }
                }
            }
            else {
                print ("Error, please choose a valid number")
                denomination = true
                choice = Int (readLine() ?? "0")!
            }
        }
        return answer
    }
    
    //MARK: - Characters types
    
    //Displaying the type of characters
    func charactersTypes(){
        print ("1.Mage")
        print ("2.Archer")
        print ("3.Warrior")
        print ("4.Dwarf")
        print ("5.Knight")
        print ("6.DragonSlayer")
    }
    
    // MARK: - Error message for the user
    
    func wrongChoice(){
        let playerChoice = Int (readLine() ?? "0")
        if playerChoice != nil {
            self.choice = playerChoice! as Int
        } else {
            print ("Please choose an available choice")
            wrongChoice()
        }
    }
    
    //MARK: - Characters naming
    
    //Asking the player to choose the name for the characters
    func charactersNameChoice (){
        while characters.count<3{
            charactersTypes ()
            wrongChoice()
            let name = uniqueName (index:self.choice)
            var character : Character?
            switch self.choice {
            case 1 : character = Mage (name:name)
            case 2 : character = Archer (name: name)
            case 3 : character = Warrior (name: name)
            case 4 : character = Dwarf (name: name)
            case 5 : character = Knight (name: name)
            case 6 : character = DragonSlayer (name: name)
            default : print ("Error, please choose a valid number ")
            }
            if character != nil{
                characters.append (character!)
                charactersNames.append(character!.name)
                print(character!.description)
            }
        }
    }
    // Making the players choose their characters and the names of their teams member
    func chooseTeamCharacters (){
        print ("Player \(playerNumber),choose your characters and the name for your team by pressing the number of your choice!")
        charactersNameChoice ()
    }
}
