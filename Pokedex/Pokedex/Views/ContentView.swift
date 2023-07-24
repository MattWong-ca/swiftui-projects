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
    
    private var filteredPokemon: [Pokemon] {
        return pokedex.filter { pokemon in
            searchText.isEmpty || pokemon.name.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(pokedex) { pokemon in
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
            }
            .navigationTitle("Pokédex")
            .searchable(text: $searchText) {
                // When searching, if we want to keep the same list and
                // not have a new list with just the Pokemon names, we
                // can delete the ForEach block and use filteredPokemon
                // on line 23 instead
                ForEach(filteredPokemon) { pokemon in
                    NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                        Text(pokemon.name)
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(pokedex: loadCSVData())
    }
}
