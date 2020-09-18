////  DataModel.swift
//  PointAndLine
//
//  Created by Simone Barbara on 05/09/2020.
//  Copyright © 2020 Simone Barbara. All rights reserved.
//

import Foundation

struct Point {
    let x: Double
    let y: Double
}

struct LineCoordinates {
    let startPoint: Point
    let endPoint: Point
}

struct Line {
    let color: String
    let stroke: Int
    let alpha: Double
    let coordinates: LineCoordinates
    var isVisible: Bool
}
