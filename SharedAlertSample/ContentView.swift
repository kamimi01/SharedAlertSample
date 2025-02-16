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
            Button(action: {
                viewModel.showAlert1()
            }) {
                Text("Show Alert1")
            }
            
            Button(action: {
                viewModel.showAlert2()
            }) {
                Text("Show Alert2")
            }

            Button(action: {
                viewModel.showAlert3()
            }) {
                Text("Show Alert3")
            }
        }
        .padding()
        .showAlert(isShowing: $viewModel.isShowingAlert, details: viewModel.details)
    }
}

#Preview {
    ContentView()
}
