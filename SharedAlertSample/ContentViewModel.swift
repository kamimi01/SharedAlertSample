//
//  ContentViewModel.swift
//  SharedAlertSample
//
//  Created by Mika Urakawa on 2025-02-09.
//

import Foundation

final class ContentViewModel: ObservableObject, AlertPresentable {
    @Published var isShowingAlert: Bool = false
    @Published var details = AlertDetails(title: "", message: "", buttons: [AlertButton(title: "")])
    
    func showAlert1() {
        let button = AlertButton(title: "OK", action: {
            print("alert1 button")
        })
        details = AlertDetails(title: "Alert1", message: "Alert1 message", buttons: [button])
        isShowingAlert = true
    }
    
    func showAlert2() {
        let button1 = AlertButton(title: "Action", action: {
            print("alert2 button1")
        })
        let button2 = AlertButton(title: "Cancel", role: .cancel, action: {
            print("alert2 button2")
        })
        details = AlertDetails(title: "Alert2", message: "Alert2 message", buttons: [button1, button2])
        isShowingAlert = true
    }

    func showAlert3() {
        let button1 = AlertButton(title: "Action1", action: {
            print("alert3 button1")
        })
        let button2 = AlertButton(title: "Action2", action: {
            print("alert3 button2")
        })
        let button3 = AlertButton(title: "Action3", action: {
            print("alert3 button3")
        })
        details = AlertDetails(title: "Alert3", message: "Alert3 message", buttons: [button1, button2, button3])
        isShowingAlert = true
    }
}
