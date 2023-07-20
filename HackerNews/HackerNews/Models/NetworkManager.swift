//
//  NetworkManager.swift
//  Hacker News
//
//  Created by Matthew Wong on 2023-07-18.
//

import Foundation

// NetworkManager has properties we want to observe
// ObservableObject needs to be a class
class NetworkManager: ObservableObject {
    
    // @Published: any changes to this will tell SwiftUI that the
    // object has changed and will update any views dependent on it
    @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            // dataTask is async network request on background thread
            // Closure will be executed async when the network request is complete
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            // UI updates must be on main thread
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            // Need to call resume() to initiate the actual network request
            task.resume()
        }
    }
}
