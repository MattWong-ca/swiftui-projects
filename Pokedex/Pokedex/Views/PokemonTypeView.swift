//
//  PokemonTypeView.swift
//  Pokedex
//
//  Created by Matthew Wong on 2023-07-22.
//

import SwiftUI

// The small colored tags that show the Pokemon's type
struct PokemonTypeView: View {
    var pokemonType: String
    
    var body: some View {
        Text(pokemonType)
            .font(.system(size: 10))
            .bold()
            .foregroundColor(.white)
            .padding(5)
            .background(Color(pokemonType))
            .cornerRadius(10)
    }
}

struct PokemonTypeView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonTypeView(pokemonType: loadCSVData().first!.type1)
    }
}
