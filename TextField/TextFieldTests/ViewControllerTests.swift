//
//  ViewControllerTests.swift
//  TextFieldTests
//
//  Created by ByungHoon Ann on 2023/02/24.
//

import UIKit
import XCTest
@testable import TextField

final class ViewControllerTests: XCTestCase {
    private var sut: ViewController!

    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(
                identifier: String(describing: ViewController.self))
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        executeRunLoop()
        sut = nil
        super.tearDown()
    }

    func test_textField_Outlet이_제대로_연결이되어있는지() {
        XCTAssertNotNil(sut.usernameTextField, "usernameTextField")
        XCTAssertNotNil(sut.passwordTextField, "passwordTextField")
    }

    func test_usernameTextField가_attributes속성이_제대로_설정이되어있는지() {
        let textField = sut.usernameTextField!
        XCTAssertEqual(textField.textContentType, .username, "textContentType")
        XCTAssertEqual(textField.autocorrectionType, .no, "autocorrectionType")
        XCTAssertEqual(textField.returnKeyType, .next, "returnKeyType")
    }

    func test_passwordTextField가_attributes설정이_제대로_되어있는지() {
        let textField = sut.passwordTextField!
        XCTAssertEqual(textField.textContentType, .password, "textContentType")
        XCTAssertEqual(textField.returnKeyType, .go, "returnKeyType")
        XCTAssertTrue(textField.isSecureTextEntry, "isSecureTextEntry")
    }

    func test_textFieldDelegates_채택을_제대로_했는지() {
        XCTAssertNotNil(sut.usernameTextField.delegate, "usernameTextField")
        XCTAssertNotNil(sut.passwordTextField.delegate, "passwordTextField")
    }

    #if false
    func test_shouldChangeCharacters_usernameWithSpaces_shouldPreventChange() {
        let allowChange = sut.usernameTextField.delegate?.textField?(
                sut.usernameTextField,
                shouldChangeCharactersIn: NSRange(),
                replacementString: "a b")

        XCTAssertEqual(allowChange, false)
    }
    #endif

    func test_shouldChangeCharacters_usernameField의_text값에_space가_포함되면_shouldChangCharacters_값을_false를_리턴하는지() {
        let allowChange = shouldChangeCharacters(in: sut.usernameTextField,
                replacement: "a b")

        XCTAssertEqual(allowChange, false)
    }

    func test_shouldChangeCharacters_text값에_space가_없으면_shouldAllowChange가_true를_리턴하는지() {
        let allowChange = shouldChangeCharacters(in: sut.usernameTextField,
                replacement: "abc")

        XCTAssertEqual(allowChange, true)
    }

    func test_shouldChangeCharacters_passwordField_text값에_Spaces가_포함되도_shouldAllowChange가true를_리턴하는지() {
        let allowChange = shouldChangeCharacters(in: sut.passwordTextField,
                replacement: "a b")

        XCTAssertEqual(allowChange, true)
    }

    func test_shouldChangeCharacters_Spaces가_포함되지않아도_shouldAllowChange가true를_리턴하는지() {
        let allowChange = shouldChangeCharacters(in: sut.passwordTextField,
                replacement: "abc")

        XCTAssertEqual(allowChange, true)
    }

    #if false
    func test_shouldReturn_withUsername_shouldProcessReturnButton() {
        let allowReturn = sut.usernameTextField
                .delegate?.textFieldShouldReturn?(sut.usernameTextField)
        
        XCTAssertEqual(allowReturn, true)
    }
    #endif
    
    #if false
    func test_shouldReturn_withPassword_shouldPerformLogin() {
        sut.usernameTextField.text = "USERNAME"
        sut.passwordTextField.text = "PASSWORD"

        _ = sut.passwordTextField.delegate?.textFieldShouldReturn?(sut.passwordTextField)

        // Normally, assert something
    }
    #endif

    func test_shouldReturn_withPassword_shouldPerformLogin() {
        sut.usernameTextField.text = "USERNAME"
        sut.passwordTextField.text = "PASSWORD"

        shouldReturn(in: sut.passwordTextField)

        // Normally, assert something
    }
    
    func test_shouldReturn_withUsername_shouldMoveInputFocusToPassword() {
        putInViewHierarchy(sut)

        shouldReturn(in: sut.usernameTextField)

        XCTAssertTrue(sut.passwordTextField.isFirstResponder)
    }

    func test_shouldReturn_withPassword_shouldDismissKeyboard() {
        putInViewHierarchy(sut)
        sut.passwordTextField.becomeFirstResponder()
        XCTAssertTrue(sut.passwordTextField.isFirstResponder, "precondition")

        shouldReturn(in: sut.passwordTextField)

        XCTAssertFalse(sut.passwordTextField.isFirstResponder)
    }
}

