//
//  optionset.swift
//  ToDo
//
//  Created by Rishabh Raj on 15/06/18.
//  Copyright © 2018 Rishabh Raj. All rights reserved.
//

import Foundation

struct ButtonOptions: OptionSet {
    let rawValue: Int
    
    static let roundedText    = ButtonOptions(rawValue: 1 << 0)
    static let squareIcon  = ButtonOptions(rawValue: 1 << 1)
//    static let squareText   = ButtonOptions(rawValue: 1 << 2)
    
}
