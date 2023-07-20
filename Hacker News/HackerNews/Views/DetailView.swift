//
//  DetailView.swift
//  Hacker News
//
//  Created by Matthew Wong on 2023-07-19.
//

import SwiftUI

// View once someone clicks a list link
struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com/")
    }
}
