//
//  CardManager.swift
//  Memory
//
//  Created by Matthew Wong on 2023-07-28.
//

import Foundation

class Card: Identifiable, ObservableObject {
    var id = UUID()
    @Published var isFaceUp = false
    @Published var isMatched = false
    var text: String
    
    init(text: String) {
        self.text = text
    }
    
    func turnOver() {
        self.isFaceUp.toggle()
    }
}

func createCardList() -> [Card] {
    let cardValues: [String] = [
        "🏀", "⚽", "⚾", "🥎", "🏐", "🏈", "🎾", "🏸", "🏓", "🏒", "🥊", "🥋"
    ]
    
    var cardList = [Card]()
    
    // Each emoji is instantiated as a Card and added 2x in cardList
    for cardValue in cardValues {
        cardList += [Card(text: cardValue), Card(text: cardValue)]
    }
    
    return cardList
}
