//
//  PokedexApp.swift
//  Pokedex
//
//  Created by Matthew Wong on 2023-07-21.
//

import SwiftUI

@main
struct PokedexApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(pokedex: loadCSVData())
        }
    }
}
