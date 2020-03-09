//
//  DetailViewControllerTests.swift
//  NikeTestTests
//
//  Created by Apple on 3/6/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import XCTest
@testable import NikeTest

class DetailViewControllerTests: XCTestCase {

    var sut: DetailViewController!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
         sut = DetailViewController()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testViewDidLoad() {
        //when
        sut.viewDidLoad()
        
        //Then
        XCTAssertTrue(sut.isViewLoaded)
    }
    
    func testImageloadedAndTextLoadedSuccessfully() {
        //Given
      
        
       
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
