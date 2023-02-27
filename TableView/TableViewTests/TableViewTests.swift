//
//  TableViewTests.swift
//  TableViewTests
//
//  Created by ByungHoon Ann on 2023/02/27.
//

import XCTest
@testable import TableView

final class TableViewTests: XCTestCase {
    
     var sut: ViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "ViewController")
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_tableViewDataSource를_채택했는지() {
        XCTAssertNotNil(sut.tableView.dataSource, "dataSource")
    }
    
    func test_tableViewDelegate를_채택했는지() {
        XCTAssertNotNil(sut.tableView.delegate, "delegate")
    }

    func test_numberOfRows함수가_3개_리턴되었는지() {
        XCTAssertEqual(numberOfRows(in: sut.tableView), 3)
    }

    func test_cellForRow_0번째Row의_textLabel_text값이_One인지() {
        let cell = cellForRow(in: sut.tableView, row: 0)

        XCTAssertEqual(cell?.textLabel?.text, "One")
    }

    func test_cellForRow_1번째Row의_textLabel_text값이_Two인지() {
        let cell = cellForRow(in: sut.tableView, row: 1)

        XCTAssertEqual(cell?.textLabel?.text, "Two")
    }

    func test_cellForRow_2번째Row의_textLabel_text값이_Three인지() {
        let cell = cellForRow(in: sut.tableView, row: 2)

        XCTAssertEqual(cell?.textLabel?.text, "Three")
    }

    func test_didSelect한_row값이_1인지() {
        didSelectRow(in: sut.tableView, row: 1)

        // Normally, assert something
    }
}
