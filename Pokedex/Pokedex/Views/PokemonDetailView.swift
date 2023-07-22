//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Matthew Wong on 2023-07-21.
//

import SwiftUI

struct PokemonDetailView: View {
    
    var pokemon: Pokemon
    
    var body: some View {
        List {
            Section("TYPE") {
                HStack {
                    Text("Type 1:")
                    Spacer()
                    PokemonTypeView(pokemonType: pokemon.type1)
                }
                if !pokemon.type2.isEmpty {
                    HStack {
                        Text("Type 2:")
                        Spacer()
                        PokemonTypeView(pokemonType: pokemon.type2)
                    }
                }
            }
            Section("STATS") {
                HStack {
                    Text("Total:")
                    Spacer()
                    Text(String(pokemon.total))
                }
                HStack {
                    VStack {
                        Text("HP")
                        Text(String(pokemon.hp))
                    }
                    Spacer()
                    VStack {
                        Text("Attack")
                        Text(String(pokemon.attack))
                    }
                    Spacer()
                    VStack {
                        Text("Defense")
                        Text(String(pokemon.defense))
                    }
                    Spacer()
                    VStack {
                        Text("Speed")
                        Text(String(pokemon.speed))
                    }
                }
            }
            PokemonImageView(pokemonId: pokemon.id)
        }
        .navigationTitle(pokemon.name+" #"+String(format: "%03d", pokemon.id))
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: loadCSVData().first!)
    }
}

struct PokemonImageView: View {
    
    let pokemonId: Int
        
    @State private var image: UIImage? = nil

    // Since image is nil to start, it'll always enter else block
    // on 1st go and fetchImage(). It's a @State var, so once
    // it updates it'll go through if block 2nd time
    var body: some View {
        if let image = image {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
        } else {
            // Image var is updated with the fetched image before
            // the view is displayed on screen, so won't see this text
            Text("Image not available")
                .onAppear {
                    fetchImage()
                }
        }
    }

    private func fetchImage() {
        // Not directly using PokeAPI endpoints for JSON data, just using image URLs
        let imageURL = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(pokemonId).png")!

        URLSession.shared.dataTask(with: imageURL) { data, response, error in
            guard let data = data, error == nil else {
                print("Failed to download image: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        // Start network request to fetch image data
        }.resume()
    }
}
