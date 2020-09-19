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
    
    private var lines = [Line]() {
        didSet {
            
        }
        willSet {
            
        }
    }
    
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
   
    func undo(completion: @escaping () -> ()) {
        guard let lastLine = lines.popLast() else {
            return
        }

        setLine(from: lastLine.coordinates.startPoint, isVisible: !lastLine.isVisible) {
            completion()
        }
        
    }
    
    func setLine(from endPoint: Point, isVisible: Bool, completion: @escaping () -> Void) {
        let line: Line
        if getLines.count > 0 {
            let initialPoint = getLastEndPoint()
            line = Line(color: "", stroke: 0, alpha: 0, coordinates: LineCoordinates(startPoint: initialPoint, endPoint: endPoint), isVisible: isVisible)
           
        }else {
            line = Line(color: "", stroke: 0, alpha: 0, coordinates: LineCoordinates(startPoint: endPoint, endPoint: endPoint), isVisible: isVisible)
            
        }
        privateQueue.async(flags: .barrier) {
            self.lines.append(line)
            completion()
        }
       
    }
    
    var getLines: [Line] {
        return  privateQueue.sync{
            self.lines
        }
    }
    
}
