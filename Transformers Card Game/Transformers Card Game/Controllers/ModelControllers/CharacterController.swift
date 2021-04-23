//
//  CharacterController.swift
//  Transformers Card Game
//
//  Created by Thomas Mazza on 4/22/21.
//

import UIKit


class CharacterController {
    static let autobots = [
        Character(characterName: "Bumblebee", characterImage: #imageLiteral(resourceName: "bumblebee"), faction: "autobots"),
        Character(characterName: "Optimus Prime", characterImage: #imageLiteral(resourceName: "optimusPrime"), faction: "autobots"),
        Character(characterName: "Ratchet", characterImage: #imageLiteral(resourceName: "ratchet"), faction: "autobots"),
        Character(characterName: "Ironhide", characterImage: #imageLiteral(resourceName: "ironhide"), faction: "autobots"),
        Character(characterName: "Jazz", characterImage: #imageLiteral(resourceName: "jazz"), faction: "autobots"),
        Character(characterName: "Prowl", characterImage: #imageLiteral(resourceName: "prowl"), faction: "autobots")]

static let decepticons = [
    Character(characterName: "Megatron", characterImage: #imageLiteral(resourceName: "megatron") , faction: "decepticons"),
    Character(characterName: "Frenzy", characterImage: #imageLiteral(resourceName: "frenzy"), faction: "decepticons"),
    Character(characterName: "Brawl", characterImage: #imageLiteral(resourceName: "brawl"), faction: "decepticons"),
    Character(characterName: "Bonecrusher", characterImage: #imageLiteral(resourceName: "bonecrusher"), faction: "decepticons"),
    Character(characterName: "Barricade", characterImage: #imageLiteral(resourceName: "barricade"), faction: "decepticons"),
    Character(characterName: "Starscream", characterImage: #imageLiteral(resourceName: "starscream"), faction: "decepticons")]
    
}// end of class
