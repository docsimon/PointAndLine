////  LineRepository.swift
//  PointAndLine
//
//  Created by Simone Barbara on 05/09/2020.
//  Copyright © 2020 Simone Barbara. All rights reserved.
//

import Foundation

protocol LineProtocol {
    func lineCoordinates(initial: Point) -> Line
    func setLineColor(coord: LineCoordinates)
    func setLineThichness(coord: LineCoordinates)
    func setLineAlpha(coord: LineCoordinates)
}
