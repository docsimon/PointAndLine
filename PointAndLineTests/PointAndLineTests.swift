////  PointAndLineTests.swift
//  PointAndLineTests
//
//  Created by Simone Barbara on 05/09/2020.
//  Copyright © 2020 Simone Barbara. All rights reserved.
//

import XCTest
@testable import PointAndLine

class PointAndLineTests: XCTestCase {
    
    func testLineRepository_getLine_initialPoint() {
        let storage = MockStorageApi()
        let lineRepo = LineRepository(storage: storage)
        let point = Point(x: 10, y: 15)
        let line = lineRepo.getLine(from: point)
        
        XCTAssertEqual(line.alpha, 0)
        XCTAssertEqual(line.color, "")
        XCTAssertEqual(line.thick, 0)
        XCTAssertEqual(line.coordinates.startPoint.x, 10)
        XCTAssertEqual(line.coordinates.startPoint.y, 15)
        XCTAssertEqual(line.coordinates.endPoint.x, 10)
        XCTAssertEqual(line.coordinates.endPoint.y, 15)
    }
    
    func testLineRepository_getLine() {
        let storage = MockStorageApi()
        let lineRepo = LineRepository(storage: storage)
        let point = Point(x: 10, y: 15)
        let _ = lineRepo.getLine(from: point)
        
        let point2 = Point(x: 20, y: 55)
        
        let line2 = lineRepo.getLine(from: point2)
        
        XCTAssertEqual(line2.alpha, 0)
        XCTAssertEqual(line2.color, "")
        XCTAssertEqual(line2.thick, 0)
        XCTAssertEqual(line2.coordinates.startPoint.x, 10)
        XCTAssertEqual(line2.coordinates.startPoint.y, 15)
        XCTAssertEqual(line2.coordinates.endPoint.x, 20)
        XCTAssertEqual(line2.coordinates.endPoint.y, 55)
    }
}
