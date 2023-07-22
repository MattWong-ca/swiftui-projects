//
//  ContentView.swift
//  Pokedex
//
//  Created by Matthew Wong on 2023-07-21.
//

import SwiftUI

struct ContentView: View {
    var pokedex: [Pokemon]
    
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(pokedex: loadCSVData())
    }
}
