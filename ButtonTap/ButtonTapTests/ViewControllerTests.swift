//
//  ViewControllerTests.swift
//  ButtonTapTests
//
//  Created by ByungHoon Ann on 2023/02/17.
//

import XCTest
@testable import ButtonTap

final class ViewControllerTests: XCTestCase {
    func test_tappingButton() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        sut.loadViewIfNeeded()
        
        tap(sut.button)
    }
}
