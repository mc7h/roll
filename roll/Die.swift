//
//  Die.swift
//  roll
//
//  Created by Marc on 16/06/2016.
//  Copyright © 2016 mc7h. All rights reserved.
//

import Foundation

class Die {
    
    var type = OptionType.unknown
    
    init(withOption: OptionType) {
        self.type = withOption
    }
    
    func roll() -> Int {
        var result: Int
        
        switch self.type {
        case .dFour:
            result = Int.randomInt(withMax:4)
        case .dSix:
            result = Int.randomInt(withMax:6)
        case .dEight:
            result = Int.randomInt(withMax:8)
        case .dTen:
            result = Int.randomInt(withMax:10)
        case .dTwelve:
            result = Int.randomInt(withMax:12)
        case .dTwenty:
            result = Int.randomInt(withMax:20)
        default:
            result = 0
        }
        return result
    }
}
