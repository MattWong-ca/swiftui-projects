//
//  ContentView.swift
//  Memory
//
//  Created by Matthew Wong on 2023-07-28.
//

import SwiftUI

struct ContentView: View {
    
    private var fourColumnGrid = [GridItem(.flexible()),
                                  GridItem(.flexible()),
                                  GridItem(.flexible()),
                                  GridItem(.flexible())]
        
    @State var cards = createCardList().shuffled()
    @State var matchedCards = [Card]()
    @State var userChoices = [Card]()
    
    @State private var elapsedTime: Int = 0
    @State private var timer: Timer?
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Text("Memory Game")
                    .font(.largeTitle)
                
                LazyVGrid(columns: fourColumnGrid, spacing: 4) {
                    ForEach(cards) { card in
                        CardView(card: card,
                                 width: Int(geo.size.width/4 - 2),
                                 matchedCards: $matchedCards,
                                 userChoices: $userChoices)
                    }
                }
                Text("Time: \(elapsedTime)s")
                
                HStack {
                    Button(action: startTimer) {
                        Text("Start")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    Button(action: stopTimer) {
                        Text("Stop")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
            }
        }        
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            elapsedTime += 1
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
