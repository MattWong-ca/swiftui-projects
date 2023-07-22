//
//  CSVManager.swift
//  Pokedex
//
//  Created by Matthew Wong on 2023-07-21.
//

import Foundation

// Called when instantiating ContentView
// Returns an array of String arrays
func loadCSVData() -> [Pokemon] {
    var pokemonList = [Pokemon]()
    var data: String
    
    // Returns a string of the file path. Ex: "/path/to/your/app/pokemon.csv"
    guard let filePath = Bundle.main.path(forResource: "pokemon", ofType: "csv") else {
        print("Error: file not found")
        return []
    }
        
    // Sets `data` to one giant string of the CSV file
    do {
        data = try String(contentsOfFile: filePath)
    } catch {
        print(error)
        return []
    }
    
    data = cleanRows(file: data)
    
    // Separates `data` into strings the represent each row in CSV
    // Ex: "1,Bulbasaur,Grass,Poison,318,45,49,49,65,65,45,1,False"
    var rows = data.components(separatedBy: "\n")
    
    rows.removeFirst()
    
    for row in rows {
        // Separates each row
        // Ex: ["1","Bulbasaur","Grass","Poison","318","45","49","49","65","65","45","1","False"]
        let pokemonProperties = row.components(separatedBy: ",")
        
        // If it has same # of properties as 1st row (since it's manually verified)
        // Create Pokemon instance and add it to array
        if pokemonProperties.count == rows.first?.components(separatedBy: ",").count {
            let pokemon = Pokemon(pokemonRow: pokemonProperties)
            pokemonList.append(pokemon)
        }
    }
    
    return pokemonList
}

// Takes in one giant string of the CSV file
// Returns same giant string, but ensures any
// \r or \n characters are all replaced by single \n
func cleanRows(file: String) -> String {
    var cleanFile = file.replacingOccurrences(of: "\r", with: "\n")
    cleanFile = cleanFile.replacingOccurrences(of: "\n\n", with: "\n")
    return cleanFile
}
