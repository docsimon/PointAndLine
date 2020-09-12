////  LineViewModel.swift
//  PointAndLine
//
//  Created by Simone Barbara on 06/09/2020.
//  Copyright © 2020 Simone Barbara. All rights reserved.
//

import Foundation

class LineViewModel {
    let model: LineRepositoryProtocol
    weak var viewDelegate: UpdateLineProtocol?
    
    init(model: LineRepositoryProtocol = LineRepository()) {
        self.model = model
    }
}

extension LineViewModel: LineViewModelProtocol {
    var allLines: [Line] {
        return model.getLines
    }
    
    
    var delegate: UpdateLineProtocol? {
        get {
            return self.viewDelegate
        }
        set {
            self.viewDelegate = newValue
        }
    }
    
    func getLineCoords(from point: Point) {
        let _ = model.getLine(from: point)
        self.delegate?.updateDraw()
    }
    
}
