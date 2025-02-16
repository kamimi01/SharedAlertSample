//
//  ContetPageObject.swift
//  SharedAlertSampleUITests
//
//  Created by Mika Urakawa on 2025-02-16.
//

import XCTest

protocol PageObject {
    var app: XCUIApplication { get }
}

struct ContentPageObject: PageObject {
    let app: XCUIApplication
    private let TIMEOUT = 5.0

    private enum Identifiers {
        static let alert1Button: String = "alert1_button"
        static let alert2Button: String = "alert2_button"
        static let alert3Button: String = "alert3_button"
    }

    private var showAlert1Button: XCUIElement {
        return app.buttons[Identifiers.alert1Button]
    }

    private var alert1Title: XCUIElement {
        return app.staticTexts["Alert1"]
    }

    private var alert1Message: XCUIElement {
        return app.staticTexts["Alert1 message"]
    }

    private var alert1Button: XCUIElement {
        return app.buttons["OK"]
    }

    func showAlert1() -> Self {
        showAlert1Button.tap()
        return self
    }

    @discardableResult
    func verifyAlert1ForShowing() -> Self {
        XCTAssertTrue(alert1Title.waitForExistence(timeout: TIMEOUT))
        XCTAssertTrue(alert1Message.waitForExistence(timeout: TIMEOUT))
        XCTAssertTrue(alert1Button.waitForExistence(timeout: TIMEOUT))
        return self
    }

    func dimissAlert1() -> Self {
        alert1Button.tap()
        return self
    }

    @discardableResult
    func verifyAlert1ForDismissing() -> Self {
        XCTAssertTrue(alert1Title.waitForNonExistence(timeout: TIMEOUT))
        return self
    }

    func showAlert2() -> Self {
        let alert2Button = app.buttons[Identifiers.alert2Button]
        alert2Button.tap()
        return self
    }

    func showAlert3() -> Self {
        let alert3Button = app.buttons[Identifiers.alert3Button]
        alert3Button.tap()
        return self
    }
}
