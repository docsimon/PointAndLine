////  MockStorageApi.swift
//  PointAndLineTests
//
//  Created by Simone Barbara on 06/09/2020.
//  Copyright © 2020 Simone Barbara. All rights reserved.
//

import Foundation

struct MockStorageApi: StorageApiProtocol {
    func save(graph: [Line], result: (Result<Bool, Error>) -> Void) {
        
    }
    
    func save(line: Line, result: (Result<Bool, Error>) -> Void) {
        
    }
    
    func load() -> [Line] {
        return []
    }
    
    
}
