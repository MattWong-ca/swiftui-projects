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
        
        if matchedCards.contains(where: {$0.id == card.id}) {
            Text(" ")
                .font(.system(size: 50))
                .padding()
                .frame(width: CGFloat(width), height: CGFloat(width))
                .background(.white)
                .cornerRadius(5)
                .opacity(0)

        } else {
            
            
            if card.isFaceUp /*|| matchedCards.contains(where: {$0.id == card.id})*/ {
                Text(card.text)
                    .font(.system(size: 50))
                    .padding()
                    .frame(width: CGFloat(width), height: CGFloat(width))
                    .background(.blue)
                    .cornerRadius(5)
            } else {
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
            }
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
