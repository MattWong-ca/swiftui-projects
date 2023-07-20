//
//  WebView.swift
//  Hacker News
//
//  Created by Matthew Wong on 2023-07-19.
//

import Foundation
import WebKit
import SwiftUI

// UIViewRepresentable: SwiftUI view that represents UIKit view
struct WebView: UIViewRepresentable {
    
    let urlString: String?
        
    // Makes WebKit WebView and turns it to SwiftUI WebView
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    // Updates the view with new info from SwiftUI
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}
