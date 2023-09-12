//
//  ContentView.swift
//  ChatApp
//
//  Created by Matthew Wong on 2023-09-06.
//

import SwiftUI

struct ContentView: View {
    // Temporary
    var messageArray = ["Hello", "How ya doing", "I'm great!"]
    
    var body: some View {
        VStack {
            TitleRow()
                .background(Color("Peach"))
            
            ScrollView {
                ForEach(messageArray, id: \.self) { text in
                    MessageBubble(message: Message(id: "123", text: text, received: true, timestamp: Date()))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
