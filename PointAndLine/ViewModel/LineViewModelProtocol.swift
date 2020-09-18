////  LineViewModelProtocol.swift
//  PointAndLine
//
//  Created by Simone Barbara on 06/09/2020.
//  Copyright © 2020 Simone Barbara. All rights reserved.
//

import Foundation

protocol LineViewModelProtocol {
    func setLine(from point: Point, isVisible: Bool)
    var allLines: [Line] {get}
    var delegate: UpdateLineProtocol? {get set}
}

protocol UpdateLineProtocol: class {
    func updateDraw()
}
