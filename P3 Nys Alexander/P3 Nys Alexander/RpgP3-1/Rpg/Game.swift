//
//  Game.swift
//  Rpg
//
//  Created by ONIZUKA  on 30/07/2020.
//  Copyright © 2020 ONIZUKA . All rights reserved.
//
import Foundation

class Game {
    var playerChoiceGlobal = -1
    var player1 = Player(playerNumber: 1)
    var player2 = Player(playerNumber: 2)
    var currentPlayer = Int ()
    private var numberTurn = 0
    // Game parameter to trigger the game.
    var runGame = true
    // Running the game
    
    //MARK: - Game Start
    
    func startGame(){
        createTeamsNames ()
        startBattle ()
        displayWinner ()
        gameStats ()
    }
    // Creating the teams names
    private func createTeamsNames(){
        player1.createTeamName()
        player2.createTeamName()
    }
    //MARK: Game actions
    // Making sure that the game is going on until one of the opposite side is dead
    private func gameOver ()->Bool {
        if player1.playerIsDead (){
            return true
        }
        else if player2.playerIsDead(){
            return true
        }else{
            return false
        }
    }
    //Here we make the possibility for the player to heal another member of his team
    func healTeam (){
        var player : Player
        if currentPlayer == player1.playerNumber{
            player = player1
        }else {
            player = player2
        }
        chooseYourCharacter (player: player)
        let actualCharacter = self.playerChoiceGlobal
        unavailableChoice ()
        let choice = self.playerChoiceGlobal
        let character = player.characters [choice-1]
        character.healTeammate(characters : character,canHeal : player.characters[actualCharacter-1].canHeal)
        print(character.description)
    }
    // Here we display the characters so that the players can choose who to play with
    func chooseYourCharacter (player:Player){
        for i in 0..<player.characters.count{
            let number = i + 1
            print ( "\(number):" + player.characters[i].name)
        }
    }
    // Return an error message for the player when he makes an unavailable choice
    func unavailableChoice (){
        let playerChoice = Int (readLine() ?? "0")
        if playerChoice != nil {
            self.playerChoiceGlobal = playerChoice! as Int
        } else {
            print ("Please choose an available choice")
            unavailableChoice ()
        }
    }
    
    //MARK: - Game dead members
    
    //Removing dead member of the team
    func deadMemberTeam1 (){
        for (index,characters) in player1.characters.enumerated (){
            if characters.lifePoint == 0 {
                player1.arrayDead.append (characters)
                player1.characters.remove (at: index)
            }
        }
    }
    //Removing dead member of the team
    func deadMemberTeam2 (){
        player2.characters.forEach {
            character in if character.lifePoint == 0 {
                player2.arrayDead.append (character)
                let i = player2.characters.firstIndex (where: {$0.name == character.name})
                player2.characters.remove (at: i!)
            }
        }
    }
    
    //MARK: - Game turn statistics
    
    //Applying game turn counting
    func gameTurnCount (){
        numberTurn += 1
        print ("this is game turn number \(numberTurn)")
    }
    
    //MARK: - Game actions N°2
    
    //Asking the Team1 to make their move regarding the game
    func gamerChoiceTeam1 (){
        let player1Choice2 = self.playerChoiceGlobal
        gamerChoice (gamer: player1.characters[player1Choice2-1])
    }
    //Asking the Team2 to make their move regarding the game
    func gamerChoiceTeam2 (){
        let player2Choice2 = self.playerChoiceGlobal
        gamerChoice (gamer: player2.characters[player2Choice2-1])
    }
    //Displaying the characters of Team1
    func displayCharactersTeam1 (){
        print ("Player\(player1.playerNumber) choose your character to play with by pressing the number of your choice")
        chooseYourCharacter (player: player1)
        // Here we give the description of the player 1 choice regarding the character he has chosen
        unavailableChoice ()
        let player1Choice1 = self.playerChoiceGlobal
        if player1Choice1 <= player1.characters.count{
            print(player1.characters [player1Choice1-1].description)
        } else {
            print("Wrong choice please try again")
            displayCharactersTeam1()
        }
    }
    //Displaying the characters of Team2
    func displayCharactersTeam2 (){
        print ("Player\(player2.playerNumber) choose your character to play with by pressing the number of your choice")
        chooseYourCharacter (player: player2)
        // Here we give the description of the player 2 choice regarding the character he has chosen
        unavailableChoice ()
        let player2Choice1 = self.playerChoiceGlobal
        if player2Choice1 <= player2.characters.count{
            print(player2.characters [player2Choice1-1].description)
        } else {
            print("Wrong choice please try again")
            displayCharactersTeam2()
        }
    }
    // Gamer action to attack his ennemy
    func attack(enemyPlayer:Player,gamer:Character){
        print ("player\(currentPlayer) choose whom to play against by pressing the number of your choice")
        chooseYourCharacter (player: enemyPlayer)
        unavailableChoice ()
        if playerChoiceGlobal <= enemyPlayer.characters.count{
            gamer.attack (characters : enemyPlayer.characters [playerChoiceGlobal-1])
        } else{
            print("Wrong choice please try again")
            attack(enemyPlayer: enemyPlayer, gamer: gamer)
        }
    }
    
    //MARK: - Game choices
    
    // Asking the player if he wants to attack, roll the dice or heal his teammate
    func gamerChoice (gamer:Character){
        var choice : Int
        var enemyPlayer : Player
        if currentPlayer == player1.playerNumber {
            enemyPlayer = player2
        } else {
            enemyPlayer = player1
        }
        repeat {
            print ("Player, what do you want to do")
            print ("1. Roll the dice and see what you find")
            print ("2. Attack your enemy")
            print ("3. Heal your Team ")
            unavailableChoice ()
            choice = playerChoiceGlobal
        }
            while choice != 1 && choice != 2 && choice != 3
        if choice == 1 {
            gamer.rollTheDice(character: gamer)
        }
        else if choice == 2 {
            attack(enemyPlayer: enemyPlayer, gamer: gamer)
        }
        else if choice == 3 {
            print("who do you want to heal ?")
            healTeam()
        }
    }
    
    // MARK: - Game play
    
    // This is the battle where we find out which team is winning by playing until all the members of the opposite side is dead
    private func startBattle (){
        while !gameOver (){
            // Here we make sure who is playing of the two players
            currentPlayer = 1 // We display the characters of the player 1
            displayCharactersTeam1 ()
            //Here we ask the Player 1 to make his choices regarding the game to attack his enemy roll the dice heal his own teammate
            gamerChoiceTeam1 ()
            // Here we count the number of turns the game is undergoing
            gameTurnCount ()
            // Here we remove the characters that don't have any life points left
            deadMemberTeam2 ()
            if player2.playerIsDead (){
                break
            }
            // Here we make sure who is playing of the two players
            currentPlayer = 2 // We display the characters of the player 2
            displayCharactersTeam2 ()
            //Here we ask the Player 2 to make his choices regarding the game to attack his enemy roll the dice heal his own teammate
            gamerChoiceTeam2 ()
            // Here we count the number of turns the game is undergoing
            gameTurnCount ()
            // Here we remove the characters that don't have any life points left
            deadMemberTeam1 ()
        }
    }
    
    //MARK: - Game statistics
    
    // Displaying the winner by mentioning its Team name
    private func displayWinner (){
        var winnerName = String ()
        if player1.playerIsDead (){
            winnerName = player2.team.name
        }
        else if player2.playerIsDead (){
            winnerName = player1.team.name
        }
        print ("The winner is Team " + winnerName + "!")
    }
    // Description of the characters that are dead
    func deadMemberDescription(){
        for characters in player1.arrayDead{
            print(player1.team.name)
            print(characters.description)
        }
        for characters in player2.arrayDead{
            print(player2.team.name)
            print(characters.description)
        }
    }
    // Description of the characters that are alive
    func aliveMember(){
        for characters in player1.characters{
            print(player1.team.name)
            print(characters.description)
        }
        for characters in player2.characters{
            print(player2.team.name)
            print(characters.description)
        }
    }
    // Displaying the description of the teams characters and their characteristics and the number of game turns, features
    private func gameStats (){
        print ("Feature of your game")
        print ("Number of game turns: \(numberTurn)")
        print ("team : \(player1.team.name)")
        print ("team : \(player2.team.name)")
        aliveMember()
        deadMemberDescription()
    }
}
