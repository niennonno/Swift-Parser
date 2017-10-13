//
//  Parser.swift
//  In-App Parser
//
//  Created by Aditya Vikram Godawat on 10/7/17.
//  Copyright © 2017 Aditya Vikram Godawat. All rights reserved.
//

import UIKit

class Parser {
    
    var right = String()
    var middle = String()
    var left = String()
    
    
    func getInstruction(from instructionSet: [String]) -> [String] {
        var instructionArray = [String]()
        
        for anInstructionSet in instructionSet {
            
            if anInstructionSet.contains("(") {
                let instructionSlice = anInstructionSet.slice(from: "(", to: ")")
                instructionArray.append(instructionSlice!)
            } else {
                continue
            }
        }
        
        return instructionArray
    }
    
    
    func getGotoStep(from instructionSet: [String]) -> [String] {
        
        var gotoArray = [String]()
        
        for anInstructionSet in instructionSet {
            let  anInstructionSetArray = anInstructionSet.components(separatedBy: " ")
            let gotoIndex = anInstructionSetArray.index(of: "goto")
            gotoArray.append(anInstructionSetArray[gotoIndex!+1])
        }
        return gotoArray
    }
    
    func performInstruction(_ instruction: String, on a: Any) -> Bool {
        
        getOperands(instruction: instruction, with: a)
        let response = switchOfMiddle(middle: middle, a: a)
        
        return response
    }
    
    private func getOperands(instruction: String, with a: Any) {
        let  anInstructionSetArray = instruction.components(separatedBy: " ")
        left = anInstructionSetArray[0]
        middle = anInstructionSetArray[1]
        right = anInstructionSetArray[2]
    }
    
    func switchOfMiddle(middle: String, a: Any) -> Bool {
        
        switch middle {
        case "==":
            
            if String(describing: a) == right {
                return true
            } else {
                return false
            }
            
        case ">":
            
            if let a = a as! Double && _ = right as Double {
                if a > right as! Double  {
                    return true
                } else {
                    return false
                }
                
            } else {
                return false
            }

            
        case "<":
            
            if let a = a as! Double && _ = right as Double {
                if a < right as! Double  {
                    return true
                } else {
                    return false
                }
                
            } else {
                return false
            }
            
        case ">=":
            
            if let a = a as? Double {
                if a >= right {
                    return true
                } else {
                    return false
                }
                
            } else {
                return false
            }
            
        case "<=":
            
            if Double(a) <= right {
                return true
            } else {
                return false
            }
            
        case "!=":
            
            if String(describing: a) != right {
                return true
            } else {
                return false
            }
            
        default:
            return false
        }
        
    }
}


extension String {
    func slice(from: String, to: String) -> String? {
        
        return (range(of: from)?.upperBound).flatMap { substringFrom in
            (range(of: to, range: substringFrom..<endIndex)?.lowerBound).map { substringTo in
                String(self[substringFrom..<substringTo])
            }
        }
    }
}
