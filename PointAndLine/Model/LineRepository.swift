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
    
    
    init(storage: StorageApiProtocol){
        self.storage = storage
    }
}

extension LineRepository: LineRepositoryProtocol {
    func getLine(from endPoint: Point) -> Line {
        let line: Line
        if getLines.count > 0 {
            let initialPoint = getLastEndPoint()
            line = Line(color: "", thick: 0, alpha: 0, coordinates: LineCoordinates(startPoint: initialPoint, endPoint: endPoint))
           
        }else {
            line = Line(color: "", thick: 0, alpha: 0, coordinates: LineCoordinates(startPoint: endPoint, endPoint: endPoint))
            
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
