//
//  ViewControllerTests.swift
//  AlertTests
//
//  Created by ByungHoon Ann on 2023/02/20.
//

@testable import Alert
import ViewControllerPresentationSpy
import XCTest

@MainActor
class ViewControllerTests: XCTestCase {
    private var alertVerifier: AlertVerifier!
    
    private var sut: ViewController!
    
    override func setUp() {
        super.setUp()
        alertVerifier = AlertVerifier()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: String(describing: ViewController.self))
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        alertVerifier = nil
        sut = nil
        super.tearDown()
    }
    
    func test_tappingButton_shouldShowAlert() {
        sut.button.sendActions(for: .touchUpInside)
        alertVerifier.verify(
            title: "Title",
            message: "Message",
            animated: true,
            actions: [
                .cancel("Cancel"),
                .default("No Handler"),
                .default("Default"),
                .destructive("Destroy"),
            ], presentingViewController: sut
        )
        
        XCTAssertEqual(alertVerifier.preferredAction?.title, "OK", "preferred action")
    }
    
    func test_executeAlertAction_withOKButton() throws {
        tap(sut.button)
        try alertVerifier.executeAction(forButton: "OK")
    }
}
