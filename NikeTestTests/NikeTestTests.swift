//
//  NikeTestTests.swift
//  NikeTestTests
//
//  Created by Apple on 3/3/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import XCTest
@testable import NikeTest

class NikeTestTests: XCTestCase {
    
    var sut: ViewController!
    var service: MockFetchData!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = ViewController()
        service = MockFetchData()
        sut.loadView()
        sut.viewDidLoad()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testHasATableView() {
        XCTAssertNotNil(sut.tableView)
    }
    
    func testTableViewHasDelegate() {
        XCTAssertNotNil(sut.tableView.delegate)
    }
    
    func testTableViewConfromsToTableViewDelegateProtocol() {
        XCTAssertTrue(sut.conforms(to: UITableViewDelegate.self))
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:didSelectRowAt:))))
    }
    
    func testTableViewHasDataSource() {
        XCTAssertNotNil(sut.tableView.dataSource)
    }
    
    func testTableViewConformsToTableViewDataSourceProtocol() {
        XCTAssertTrue(sut.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(sut.responds(to: #selector(sut.numberOfSections(in:))))
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:cellForRowAt:))))
    }

    func testFetchDataSuccessFul() {
       //Given
        sut.fetchData()
        
        //when
        guard let artish = sut.artists else { return }

        //Then
        XCTAssertTrue(!artish.isEmpty)
    }
    
    func testFetchDataFailed() {
       //Given
        sut.fetchData()
        
        //when
        guard let artish = sut.artists else { return }

        //Then
        XCTAssertTrue(artish.isEmpty)
    }
    
    func testloadViewCalled() {
        //When
        sut.loadView()
        
        //Then
        XCTAssertNotNil(sut.isViewLoaded)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
