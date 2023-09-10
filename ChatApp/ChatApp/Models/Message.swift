//
//  Message.swift
//  ChatApp
//
//  Created by Matthew Wong on 2023-09-09.
//

import Foundation

struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var received: Bool // receiver
    var timestamp: Date
}
