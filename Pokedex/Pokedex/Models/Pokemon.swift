//
//  Pokemon.swift
//  Pokedex
//
//  Created by Matthew Wong on 2023-07-21.
//

import Foundation

// A Pokemon is an array of Strings, with each String
// representing 1 attribute (eg. Pokemon = one row in the CSV)
struct Pokemon: Identifiable {
    let id: Int
    let name: String
    let type1: String
    let type2: String
    let total: Int
    let hp: Int
    let attack: Int
    let defense: Int
    let spAttk: Int
    let spDef: Int
    let speed: Int
    let generation: Int
    let legendary: Bool
    
    // Ex: pass in ["1","Bulbasaur","Grass","Poison","318","45","49","49","65","65","45","1","False"]
    init(pokemonRow: [String]) {
        self.id = Int(pokemonRow[0])!
        self.name = pokemonRow[1]
        self.type1 = pokemonRow[2]
        self.type2 = pokemonRow[3]
        self.total = Int(pokemonRow[4])!
        self.hp = Int(pokemonRow[5])!
        self.attack = Int(pokemonRow[6])!
        self.defense = Int(pokemonRow[7])!
        self.spAttk = Int(pokemonRow[8])!
        self.spDef = Int(pokemonRow[9])!
        self.speed = Int(pokemonRow[10])!
        self.generation = Int(pokemonRow[11])!
        self.legendary = (pokemonRow[12] == "True")
    }
}
