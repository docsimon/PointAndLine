////  ScratchPadView.swift
//  PointAndLine
//
//  Created by Simone Barbara on 11/09/2020.
//  Copyright © 2020 Simone Barbara. All rights reserved.
//

import UIKit

class ScratchPadView: UIView {
    
    var viewModel: LineViewModelProtocol?
    var lines: [(CGPoint, CGPoint)] = []

    required init?(coder: NSCoder) {
        super.init(coder:coder)
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        addGestureRecognizer(tap)
        
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer){
        if sender.state == .ended {
            let location = sender.location(in: self)
            viewModel?.getLineCoords(from: Point(x: Double(location.x), y: Double(location.y)))
            
        }
    }
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if let context = UIGraphicsGetCurrentContext() {
            
            context.setStrokeColor(UIColor.gray.cgColor)
            context.setLineWidth(1)
            for point in lines {
                context.move(to: point.0)
                context.addLine(to: point.1)
                context.strokePath()
            }
           
        }
    }
    
}

extension ScratchPadView: UpdateLineProtocol {
    func newLine(line: Line) {

        let point1 = CGPoint(x: Int(line.coordinates.startPoint.x), y: Int(line.coordinates.startPoint.y))
        let point2 = CGPoint(x: Int(line.coordinates.endPoint.x), y: Int(line.coordinates.endPoint.y))
        lines.append((point1, point2))
        setNeedsDisplay()
    }
  
}
