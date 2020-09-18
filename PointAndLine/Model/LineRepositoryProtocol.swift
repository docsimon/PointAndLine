////  LineRepositoryProtocol.swift
//  PointAndLine
//
//  Created by Simone Barbara on 05/09/2020.
//  Copyright © 2020 Simone Barbara. All rights reserved.
//

import Foundation

protocol LineRepositoryProtocol {
    func getLine(from endPoint: Point) -> Line
    var getLines: [Line] {get}
    func setLine(color: String?, stroke: Int?, alpha: Double?, isVisible: Bool?)
    func save(graph: [Line], result: (Result<Bool, Error>) -> Void)
    func save(line: Line, result: (Result<Bool, Error>) -> Void)
    func load() -> [Line]
}
