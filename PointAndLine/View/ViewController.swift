////  ViewController.swift
//  PointAndLine
//
//  Created by Simone Barbara on 05/09/2020.
//  Copyright © 2020 Simone Barbara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func redo(_ sender: Any) {
        self.undo()
    }
    @IBAction func undo(_ sender: Any) {
        self.undo()
    }
    @IBOutlet weak var scratchPad: ScratchPadView!
    var viewModel: LineViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = LineViewModel()
        viewModel?.delegate = scratchPad
        scratchPad.viewModel = viewModel
        
    }
    
    func undo() {
        viewModel?.undo()
    }
    
}

