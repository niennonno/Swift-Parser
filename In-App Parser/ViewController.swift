//
//  ViewController.swift
//  In-App Parser
//
//  Created by Aditya Vikram Godawat on 10/7/17.
//  Copyright © 2017 Aditya Vikram Godawat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var instructions = String()
    var instructionSet = [String]()
    var instructionArray = [String]()
    var a = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        instructions = "(a == 100) goto 1; (a == 10) goto s2;"

        let someInstructionSet = instructions.components(separatedBy: ";")
        instructionSet = someInstructionSet
        
        instructionSet.removeLast()
        
        let instructionsToPerform = Parser().getInstruction(from: instructionSet)
        
        let gotoArray = Parser().getGotoStep(from: instructionSet)
        
        for i in 0..<instructionsToPerform.count {
            
            let anInstruction = instructionsToPerform[i]
            
            let response = Parser().performInstruction(anInstruction)
            
            if response {
                
                print("statement \(i+1) passed. Going to \(gotoArray[i])")
                
            } else {
                print("statement \(i+1) failed. On to the next")
            }
        }
    }
}
