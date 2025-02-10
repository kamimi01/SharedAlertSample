//
//  ContentView.swift
//  SharedAlertSample
//
//  Created by Mika Urakawa on 2025-02-09.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            Button(action: {}) {
                Text("Show Alert1")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
