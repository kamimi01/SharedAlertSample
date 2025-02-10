//
//  AlertView.swift
//  SharedAlertSample
//
//  Created by Mika Urakawa on 2025-02-09.
//

import SwiftUI

protocol AlertPresentable {
    var isShowingAlert: Bool { get set }
    var details: AlertDetails { get }
}

struct AlertButton: Identifiable {
    let id = UUID().uuidString
    
    let title: String
    let role: ButtonRole?
    let action: (() -> Void)?
    
    init(title: String, role: ButtonRole? = nil, action: ( () -> Void)? = nil) {
        self.title = title
        self.role = role
        self.action = action
    }
}

struct AlertDetails: Equatable {
    let title: String
    let message: String
    let buttons: [AlertButton]
    
    /// - NOTE: If it has the same title, message and button title, determined as the same
    static func == (lhs: AlertDetails, rhs: AlertDetails) -> Bool {
        var hasSameButtons: Bool {
            var isSame = true
            for (index, _) in lhs.buttons.enumerated() {
                if lhs.buttons[index].title != rhs.buttons[index].title {
                    isSame = false
                }
            }
            return isSame
        }
        
        return lhs.title == rhs.title && lhs.message == rhs.message && hasSameButtons
    }
}

struct AlertView: ViewModifier {
    @Binding var isShowing: Bool
    let details: AlertDetails
    
    func body(content: Content) -> some View {
        content
            .alert(details.title, isPresented: $isShowing) {
                ForEach(details.buttons) { button in
                    Button(role: button.role, action: {
                        button.action?()
                        isShowing = false
                    }) {
                        Text(button.title)
                    }
                }
            } message: {
                Text(details.message)
            }
    }
}

extension View {
    func showAlert(isShowing: Binding<Bool>, details: AlertDetails) -> some View {
        self.modifier(AlertView(isShowing: isShowing, details: details))
    }
}
