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
    
    func testLineViewModel_getLineCoords_initialPoint() {
        
        class MockView: UpdateLineProtocol {
            func newLine(line: Line) {
                XCTAssertEqual(line.coordinates.startPoint.x, 100)
                XCTAssertEqual(line.coordinates.startPoint.y, 110)
                XCTAssertEqual(line.coordinates.endPoint.x, 100)
                XCTAssertEqual(line.coordinates.endPoint.y, 110)
               
            }
        }
        
        let mockView = MockView()
        let model = LineRepository()
        let viewModel = LineViewModel(model: model)
        viewModel.viewDelegate = mockView
        let point1 = Point(x: 100, y: 110)
        viewModel.getLineCoords(from: point1)
        
    }
    
    func testLineViewModel_getLineCoords_twoPoints() {
           
           class MockView: UpdateLineProtocol {
               func newLine(line: Line) {
                   XCTAssertEqual(line.coordinates.startPoint.x, 100)
                   XCTAssertEqual(line.coordinates.startPoint.y, 110)
                   XCTAssertEqual(line.coordinates.endPoint.x, 200)
                   XCTAssertEqual(line.coordinates.endPoint.y, 210)
                  
               }
           }
        
        class MockModel: LineRepositoryProtocol {
            func getLine(from endPoint: Point) -> Line {
                return Line(color: "", thick: 1, alpha: 1, coordinates: LineCoordinates(startPoint: Point(x: 100, y: 110), endPoint: Point(x: 200, y: 210)))
            }
            var getLines: [Line] = []
            
            func setLineColor(coord: LineCoordinates) {
                
            }
            
            func setLineThichness(coord: LineCoordinates) {
                
            }
            
            func setLineAlpha(coord: Line) {
                
            }
            
            func save(graph: [Line], result: (Result<Bool, Error>) -> Void) {
                
            }
            
            func save(line: Line, result: (Result<Bool, Error>) -> Void) {
                
            }
            
            func load() -> [Line] {
                []
            }
            
            
        }
           
           let mockView = MockView()
           let model = MockModel()
           let viewModel = LineViewModel(model: model)
           viewModel.viewDelegate = mockView
           let point1 = Point(x: 200, y: 210)
           viewModel.getLineCoords(from: point1)
       }
}
