//
//  Die.swift
//  roll
//
//  Created by Marc on 16/06/2016.
//  Copyright © 2016 mc7h. All rights reserved.
//

import Foundation

class Die {
    
    var type = OptionType.Unknown
    
    init(option: OptionType) {
        self.type = option
    }
    
    func roll() -> Int {
        var result: Int
        
        switch self.type {
        case .DFour:
            result = Int.randomIntWithMax(4)
        case .DSix:
            result = Int.randomIntWithMax(6)
        case .DEight:
            result = Int.randomIntWithMax(8)
        case .DTen:
            result = Int.randomIntWithMax(10)
        case .DTwelve:
            result = Int.randomIntWithMax(12)
        case .DTwenty:
            result = Int.randomIntWithMax(20)
        default:
            result = 0
        }
        return result
    }
}
