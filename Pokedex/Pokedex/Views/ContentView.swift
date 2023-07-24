//
//  ContentView.swift
//  Pokedex
//
//  Created by Matthew Wong on 2023-07-21.
//

import SwiftUI
/*
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
                ForEach(filteredPokemon, id: \.self) { pokemon in
                    Text(pokemon)
                }
            }
        }
    }
    
    private var filteredPokemon: [String] {
        let arrayOfPokemonNames: [String] = pokedex.map { pokemon in
            return pokemon.name
        }
        
        return arrayOfPokemonNames.filter {
            $0.localizedCaseInsensitiveContains(searchText)
        }
    }
}
*/

struct ContentView: View {
    var pokedex: [Pokemon]
    @State private var searchText = ""
    
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
                ForEach(filteredPokemon) { pokemon in
                    NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                        HStack {
//                            Text("#" + String(format: "%03d", pokemon.id))
//                                .font(.subheadline)
                            Text(pokemon.name)
//                                .font(.headline)
                                .foregroundColor(.black)
                        }
                    }
                    
                }
            }
        }
    }
    
    private var filteredPokemon: [Pokemon] {
        return pokedex.filter { pokemon in
            searchText.isEmpty || pokemon.name.localizedCaseInsensitiveContains(searchText)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(pokedex: loadCSVData())
    }
}
