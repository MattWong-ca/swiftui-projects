//
//  TestView.swift
//  WeatherApp
//
//  Created by Matthew Wong on 2023-08-02.
//

import SwiftUI

struct TestView: View {
    @State private var usernameInput: String = ""
    var body: some View {
        TextField("Test: ", text: $usernameInput)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
