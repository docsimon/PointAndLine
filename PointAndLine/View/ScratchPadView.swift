////  ScratchPadView.swift
//  PointAndLine
//
//  Created by Simone Barbara on 11/09/2020.
//  Copyright © 2020 Simone Barbara. All rights reserved.
//

import UIKit

class ScratchPadView: UIView {
    
    var viewModel: LineViewModelProtocol?

    required init?(coder: NSCoder) {
        super.init(coder:coder)
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        addGestureRecognizer(tap)
        
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer){
        if sender.state == .ended {
            let location = sender.location(in: self)
            viewModel?.setLine(from: Point(x: Double(location.x), y: Double(location.y)), isVisible: true)
            
        }
    }
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if let context = UIGraphicsGetCurrentContext() {
            
            context.setStrokeColor(UIColor.gray.cgColor)
            context.setLineWidth(1)
            guard let lines = viewModel?.allLines else {
                return
            }
            for line in lines {
                if line.isVisible {
                    let point1 = CGPoint(x: Int(line.coordinates.startPoint.x), y: Int(line.coordinates.startPoint.y))
                    let point2 = CGPoint(x: Int(line.coordinates.endPoint.x), y: Int(line.coordinates.endPoint.y))
                    context.move(to: point1)
                    context.addLine(to: point2)
                    context.strokePath()
                }
            }
           
        }
    }
    
}

extension ScratchPadView: UpdateLineProtocol {
    func updateDraw() {
        setNeedsDisplay()
    }
    
}
