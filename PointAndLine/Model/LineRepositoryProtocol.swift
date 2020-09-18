////  LineRepositoryProtocol.swift
//  PointAndLine
//
//  Created by Simone Barbara on 05/09/2020.
//  Copyright © 2020 Simone Barbara. All rights reserved.
//

import Foundation

protocol LineRepositoryProtocol {
    func setLine(from endPoint: Point, isVisible: Bool) -> Line
    var getLines: [Line] {get}
    func undo()
}
