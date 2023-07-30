//
//  CardView.swift
//  Memory
//
//  Created by Matthew Wong on 2023-07-28.
//

import SwiftUI

struct CardView: View {
    
    @ObservedObject var card: Card
    let width: Int
    
    // Keeps track of cards the user has already matched
    @Binding var matchedCards: [Card]
    
    // Keeps track of the 1 or 2 cards user has tapped
    @Binding var userChoices: [Card]
    
    var body: some View {
        // If card is face up with emoji
        if card.isFaceUp {
            Text(card.text)
                .font(.system(size: 50))
                .padding()
                .frame(width: CGFloat(width), height: CGFloat(width))
                .background(.blue)
                .cornerRadius(5)
          // If card is not in matchedCards array
        } else if !matchedCards.contains(where: {$0.id == card.id}) {
            Text(" ")
                .font(.system(size: 50))
                .padding()
                .frame(width: CGFloat(width), height: CGFloat(width))
                .background(.blue)
                .cornerRadius(5)
                .onTapGesture {
                    if userChoices.count == 0 {
                        card.turnOver()
                        userChoices.append(card)
                    } else if userChoices.count == 1 {
                        card.turnOver()
                        userChoices.append(card)
                        
                        withAnimation(Animation.linear.delay(1)) {
                            for thisCard in userChoices {
                                thisCard.turnOver()
                            }
                        }
                        checkForMatch()
                    }
                }
        } else {
            Text(" ")
                .font(.system(size: 50))
                .padding()
                .frame(width: CGFloat(width), height: CGFloat(width))
                .background(.white)
                .cornerRadius(5)
                .opacity(0)
        }
    }
        
    func checkForMatch() {
        if userChoices[0].text == userChoices[1].text {
            matchedCards.append(userChoices[0])
            matchedCards.append(userChoices[1])
        }
        userChoices.removeAll()
    }
}

/*
enum CardState {
    case faceUp
    case faceDown
    case matched
}

struct CardView: View {
    @ObservedObject var card: Card
    let width: Int
    
    @Binding var matchedCards: [Card]
    @Binding var userChoices: [Card]
    
    private var cardState: CardState {
        if matchedCards.contains(where: { $0.id == card.id }) {
            return .matched
        } else if card.isFaceUp {
            return .faceUp
        } else {
            return .faceDown
        }
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .frame(width: CGFloat(width), height: CGFloat(width))
                .foregroundColor(cardState == .matched ? .white : .blue)
            
            Text(cardState == .faceUp ? card.text : " ")
                .font(.system(size: 50))
                .padding()
                .opacity(cardState == .matched ? 0 : 1)
        }
        .onTapGesture {
            handleTap()
        }
    }
    
    private func handleTap() {
        if cardState == .matched {
            return
        }
        
        card.turnOver()
        userChoices.append(card)
        
        if userChoices.count == 2 {
            withAnimation(Animation.linear.delay(1)) {
                for thisCard in userChoices {
                    thisCard.turnOver()
                }
            }
            
            checkForMatch()
        }
    }
    
    private func checkForMatch() {
        if userChoices[0].text == userChoices[1].text {
            matchedCards.append(contentsOf: userChoices)
        }
        userChoices.removeAll()
    }
}*/
