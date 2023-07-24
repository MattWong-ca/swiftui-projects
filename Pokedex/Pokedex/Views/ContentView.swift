//
//  ContentView.swift
//  Pokedex
//
//  Created by Matthew Wong on 2023-07-21.
//

import SwiftUI

struct ContentView: View {
    var pokedex: [Pokemon]
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            List(pokedex) { pokemon in
                NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                    HStack {
                        Text("#" + String(format: "%03d", pokemon.id))
                            .font(.subheadline)
                        Text(pokemon.name)
                            .font(.headline)
                        
                        Spacer()
                        
                        PokemonTypeView(pokemonType: pokemon.type1)
                        
                        if !pokemon.type2.isEmpty {
                            PokemonTypeView(pokemonType: pokemon.type2)
                        }
                    }
                }
            }
            .navigationTitle("Pokédex")
            .searchable(text: $searchText) {
//                ForEach(filteredPokemon) { pokemon in
//                    Text($searchText)
//                }
            }
        }
    }
    
    private var filteredPokemon: [String] {
//        let arrayOfPokemonNames: [String]
//
//        ForEach(pokedex) { pokemon in
//            arrayOfPokemonNames.append(pokemon.name)
//        }
        
        let arrayOfPokemonNames: [String] = pokedex.map { pokemon in
            return pokemon.name
        }
        
        return arrayOfPokemonNames.filter {
            $0.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    /*private var filteredItems: [String] {
            // Filter the list items based on the searchText
            // You'll have to implement this filtering logic based on your data
            // For this example, I'm just returning a static list
            let items = ["Item 1", "Item 2", "Item 3", "Another Item"]
            return items.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }*/
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(pokedex: loadCSVData())
    }
}
