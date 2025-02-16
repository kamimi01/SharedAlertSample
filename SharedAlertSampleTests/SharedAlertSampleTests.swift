//
//  SharedAlertSampleTests.swift
//  SharedAlertSampleTests
//
//  Created by Mika Urakawa on 2025-02-09.
//

import Testing
@testable import SharedAlertSample

struct SharedAlertSampleTests {
    private var viewModel: ContentViewModel

    init() {
        viewModel = ContentViewModel()
    }

    @Test func showAlert1() {
        // Arrange
        #expect(!viewModel.isShowingAlert, "❌ Alert should not be showing")

        // Act
        viewModel.showAlert1()

        // Assert
        let expectedButton = AlertButton(title: "OK", action: {
            print("alert1 button")
        })
        let expectedAlertDetails = AlertDetails(title: "Alert1", message: "Alert1 message", buttons: [expectedButton])
        #expect(viewModel.isShowingAlert, "❌ Alert should be showing")
        #expect(viewModel.alertDetails == expectedAlertDetails, "❌ Alert details is not correct")
    }

    @Test func showAlert2() {
        #expect(!viewModel.isShowingAlert, "❌ Alert should not be showing")

        // Act
        viewModel.showAlert2()

        // Assert
        let expectedButton1 = AlertButton(title: "Action", action: {
            print("alert2 button1")
        })
        let expectedButton2 = AlertButton(title: "Cancel", role: .cancel, action: {
            print("alert2 button2")
        })
        let expectedAlertDetails = AlertDetails(title: "Alert2", message: "Alert2 message", buttons: [expectedButton1, expectedButton2])
        #expect(viewModel.isShowingAlert, "❌ Alert should be showing")
        #expect(viewModel.alertDetails == expectedAlertDetails, "❌ Alert details is not correct")
    }

    @Test func showAlert3() {
        #expect(!viewModel.isShowingAlert, "❌ Alert should not be showing")

        // Act
        viewModel.showAlert3()

        // Assert
        let expectedButton1 = AlertButton(title: "Action1", action: {
            print("alert3 button1")
        })
        let expectedButton2 = AlertButton(title: "Action2", action: {
            print("alert3 button2")
        })
        let expectedButton3 = AlertButton(title: "Action3", action: {
            print("alert3 button3")
        })
        let expectedAlertDetails = AlertDetails(title: "Alert3", message: "Alert3 message", buttons: [expectedButton1, expectedButton2, expectedButton3])
        #expect(viewModel.isShowingAlert, "❌ Alert should be showing")
        #expect(viewModel.alertDetails == expectedAlertDetails, "❌ Alert details is not correct")
    }
}
