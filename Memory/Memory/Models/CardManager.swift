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

let cardValues: [String] = [
    "a", "b", "c", "d", "e", "f"
]

func createCardList() -> [Card] {
    var cardList = [Card]()
    
    for cardValue in cardValues {
        cardList.append(Card(text: cardValue))
        cardList.append(Card(text: cardValue))
    }
    
    return cardList
}

let faceDownCard = Card(text: "?")
