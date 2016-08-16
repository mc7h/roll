//
//  Int+Random.swift
//  roll
//
//  Created by Marc on 16/06/2016.
//  Copyright © 2016 mc7h. All rights reserved.
//

import Foundation

extension Int {
    static func randomInt(withMax: Int) -> Int {
        let maximum = UInt32(withMax)
        return 1 + Int(arc4random_uniform(maximum))
    }
}
