////  LineRepository.swift
//  PointAndLine
//
//  Created by Simone Barbara on 05/09/2020.
//  Copyright © 2020 Simone Barbara. All rights reserved.
//

import Foundation

class LineRepository {
    
    let storage: StorageApiProtocol
    let privateQueue = DispatchQueue(label: "Private queue", attributes: .concurrent)
    
    private var lines = [Line]()
    
    private func getLastEndPoint() -> Point {
        privateQueue.sync {
            let lastLine = lines[lines.endIndex-1]
            let lastPoint = lastLine.coordinates.endPoint
            return lastPoint
        }
    }
    
    
    init(storage: StorageApiProtocol = StorageApi()){
        self.storage = storage
    }
}

extension LineRepository: LineRepositoryProtocol {
    func setLine(color: String?, stroke: Int?, alpha: Double?, isVisible: Bool?) {
        
    }
    
    func getLine(from endPoint: Point) -> Line {
        let line: Line
        if getLines.count > 0 {
            let initialPoint = getLastEndPoint()
            line = Line(color: "", stroke: 0, alpha: 0, coordinates: LineCoordinates(startPoint: initialPoint, endPoint: endPoint), isVisible: true)
           
        }else {
            line = Line(color: "", stroke: 0, alpha: 0, coordinates: LineCoordinates(startPoint: endPoint, endPoint: endPoint), isVisible: true)
            
        }
        privateQueue.async(flags: .barrier) {
            self.lines.append(line)
        }
        return line
    }
    
    var getLines: [Line] {
        return  privateQueue.sync{
            self.lines
        }
    }
    
    
    func save(graph: [Line], result: (Result<Bool, Error>) -> Void) {
        
    }
    
    func save(line: Line, result: (Result<Bool, Error>) -> Void) {
        
    }
    
    func load() -> [Line] {
        []
    }
    
    
}
