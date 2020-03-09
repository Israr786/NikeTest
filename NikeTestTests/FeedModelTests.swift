//
//  FeedModelTests.swift
//  NikeTestTests
//
//  Created by Apple on 3/5/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import XCTest
@testable import NikeTest

class FeedModelTests: XCTestCase {
    
    func testModelResponse() throws {
        guard
            let path = Bundle.main.path(forResource: "MockResponse", ofType: "json")
            else { fatalError("Can't find search.json file") }

        let data = try Data(contentsOf: URL(fileURLWithPath: path))
        let response = try JSONDecoder().decode(Feeds.self, from: data)
        XCTAssertNotNil(response.feed.results)
    }
}
