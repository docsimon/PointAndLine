////  LineViewModelProtocol.swift
//  PointAndLine
//
//  Created by Simone Barbara on 06/09/2020.
//  Copyright © 2020 Simone Barbara. All rights reserved.
//

import Foundation

protocol LineViewModelProtocol {
    func getLineCoords(point: Point) -> Line
}

protocol UpdateLineProtocol {
    var newLine: Line {get}
}
