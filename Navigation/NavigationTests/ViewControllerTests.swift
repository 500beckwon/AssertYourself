//
//  ViewControllerTests.swift
//  NavigationTests
//
//  Created by ByungHoon Ann on 2023/02/20.
//


@testable import Navigation
import ViewControllerPresentationSpy
import XCTest

@MainActor
class ViewControllerTests: XCTestCase {
    var sut: ViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: String(describing: ViewController.self))
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        executeRunLoop()
        sut = nil
        super.tearDown()
    }
    
    
    func executeRunLoop() {
        RunLoop.current.run(until: Date())
    }
    
    func test_navigationController_shouldNotBeNil() {
        sut.loadViewIfNeeded()
        let navigation = UINavigationController(rootViewController: sut)
        
        XCTAssertNotNil(sut.navigationController)
    }
    
    func test_tappingCodePushButton_shouldPushCodeNextViewController() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        sut.loadViewIfNeeded()
        
        
        let navigation = UINavigationController(rootViewController: sut)
        
        tap(sut.codePushButton)
        
        executeRunLoop()
        XCTAssertEqual(navigation.viewControllers.count, 2, "navigation stack")
        
        #if false
        let pushedVC = navigation.viewControllers.last
        guard let codeNextVC = pushedVC as? CodeNextViewController else {
            XCTFail("Expected CodeNextViewController, " + "but was \(String(describing: pushedVC))")
            
            return }
        
        print("codeNextVC.label.text", codeNextVC.label.text)
        XCTAssertTrue(pushedVC is CodeNextViewController,
                      "Expected CodeNextViewController, "
                      + "but was \(String(describing: pushedVC))")
        #endif
        
        let pushedVC = navigation.viewControllers.last
        guard let codeNextVC = pushedVC as? CodeNextViewController else {
            XCTFail("Expected CodeNextViewController, "
                    + "but was \(String(describing: pushedVC))")
            return
        }
        XCTAssertEqual(codeNextVC.label.text, "Pushed from code")
    }
    
    func test_잘못된_codePushButton_터치() {
        UIApplication.shared.windows.first?.rootViewController = sut
        
        tap(sut.codePushButton)
        
        let presentedVC = sut.presentedViewController
        guard let codeNextVC = presentedVC as? CodeNextViewController else {
            XCTFail("Expected CodeNextViewController, " + "but was \(String(describing: presentedVC))")
            return
        }

        XCTAssertEqual(codeNextVC.label.text, "Modal from code")
    }
    
    func test_CodeModalButton를_탭하여_CodeNextViewController로_Present가_실패하는지() {
        let presentationVerifier = PresentationVerifier()

        tap(sut.codeModalButton)

        let codeNextVC: CodeNextViewController? = presentationVerifier.verify(
                animated: true, presentingViewController: sut)
        XCTAssertEqual(codeNextVC?.label.text, "Modal from code")
    }
    
    func test_SeguePushButton를_탭하여_SegueNextViewController를_보여주는지() {
        let presentationVerifier = PresentationVerifier()
        putInWindow(sut)

        tap(sut.seguePushButton)

        let segueNextVC: SegueNextViewController? = presentationVerifier.verify(
                animated: true, presentingViewController: sut)
        XCTAssertEqual(segueNextVC?.labelText, "Pushed from segue")
    }

    func test_SegueModalButton를_터치하여_SegueNextViewController로_segue하는지() {
        let presentationVerifier = PresentationVerifier()

        tap(sut.segueModalButton)

        let segueNextVC: SegueNextViewController? = presentationVerifier.verify(
                animated: true, presentingViewController: sut)
        XCTAssertEqual(segueNextVC?.labelText, "Modal from segue")
    }
}

private class TestableViewController: ViewController {
    var presentCallCount = 0
    var presentArgsViewcontroller = [UIViewController]()
    var presentArgsAnimated = [Bool]()
    var presentArgsClosure = [(() -> Void)?]()
    
    override func present(
        _ viewControllerToPresent: UIViewController,
        animated flag: Bool,
        completion: (() -> Void)? = nil) {
            presentCallCount += 1
            
            presentArgsViewcontroller.append(viewControllerToPresent)
            presentArgsAnimated.append(flag)
            presentArgsClosure.append(completion)
    }
    
}
