//
//  MessageBubble.swift
//  ChatApp
//
//  Created by Matthew Wong on 2023-09-09.
//

import SwiftUI

struct MessageBubble: View {
    var message: Message
    var body: some View {
        VStack(alignment: message.received ? .leading : .trailing) {
            HStack {
                Text(message.text)
            }
        }
    }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubble(message: Message(id: "1", text: "Hi", received: false, timestamp: Date()))
    }
}
