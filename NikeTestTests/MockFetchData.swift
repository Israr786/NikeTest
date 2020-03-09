//
//  MockFetchData.swift
//  NikeTestTests
//
//  Created by Apple on 3/5/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
@testable import NikeTest

//To be completed
class MockFetchData  {
    private(set) var isgetAlbumDataCalled = false
    func getAlbumData() {
        isgetAlbumDataCalled = true
    }
}
