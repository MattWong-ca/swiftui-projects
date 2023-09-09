//
//  ContentView.swift
//  ChatApp
//
//  Created by Matthew Wong on 2023-09-06.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TitleRow()
                .background(Color("Peach"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
