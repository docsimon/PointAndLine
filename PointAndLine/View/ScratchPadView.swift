////  ScratchPadView.swift
//  PointAndLine
//
//  Created by Simone Barbara on 11/09/2020.
//  Copyright © 2020 Simone Barbara. All rights reserved.
//

import UIKit

class ScratchPadView: UIView {
    
    var viewModel: LineViewModelProtocol?
    var origin: CGPoint = CGPoint()
    var dest: CGPoint = CGPoint()

    required init?(coder: NSCoder) {
        super.init(coder:coder)
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        addGestureRecognizer(tap)
        
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer){
        if sender.state == .ended {
            print("Tapped!!!!!!")
            let location = sender.location(in: self)
            viewModel?.getLineCoords(from: Point(x: Double(location.x), y: Double(location.y)))
            
        }
    }
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if let context = UIGraphicsGetCurrentContext() {
            context.setStrokeColor(UIColor.gray.cgColor)
            context.setLineWidth(1)
            context.move(to: self.origin)
            context.addLine(to: self.dest)
            context.strokePath()
        }
    }
    
}

extension ScratchPadView: UpdateLineProtocol {
    func newLine(line: Line) {
        print("Drawing...")
        self.origin.x = CGFloat(line.coordinates.startPoint.x)
        self.origin.y = CGFloat(line.coordinates.startPoint.y)
        self.dest.x = CGFloat(line.coordinates.endPoint.x)
        self.dest.y = CGFloat(line.coordinates.endPoint.y)
      
        setNeedsDisplay()
    }
  
}
