//
//  ContentView.swift
//  Hacker News
//
//  Created by Matthew Wong on 2023-07-18.
//

import SwiftUI

struct ContentView: View {
    
    // Subscribes to changes in networkManager and
    // automatically updates whenever any of the @Published
    // properties in the networkManager change
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        // NavigationView --> for going back/forth pages
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                            .frame(width: 50, alignment: .leading)
                        Text(post.title)
                    }
                }
            }
            .navigationBarTitle("Hacker News 🚀")
        }
        // When body view appears, fetch data from API
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
