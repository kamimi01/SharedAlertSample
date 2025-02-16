//
//  SharedAlertSampleUITests.swift
//  SharedAlertSampleUITests
//
//  Created by Mika Urakawa on 2025-02-09.
//

import XCTest

final class SharedAlertSampleUITests: XCTestCase {
    private var app: XCUIApplication!

    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
        continueAfterFailure = false
    }

    @MainActor
    func testShowAlert1() throws {
        ContentPageObject(app: app)
            .showAlert1()
            .verifyAlert1ForShowing()
            .dimissAlert1()
            .verifyAlert1ForDismissing()
    }
}
