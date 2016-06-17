//
//  main.swift
//  roll
//
//  Created by Marc on 16/06/2016.
//  Copyright © 2016 mc7h. All rights reserved.
//

import Foundation

// TODO: 1. handle a series of dice e.g roll d6 d6 d10 d20

switch Process.arguments.count {
case 1:
    var res = Die(option: .DSix).roll()
    IO.printMessage("\(res)\n")

case 2:
    let (option, value) = IO.getOption(Process.arguments[1])
    
    guard (option != OptionType.Unknown) else {
        IO.printMessage("\(IO.executableName()): illegal dice type - '\(value)'. Try d4, d6, d20 etc.\n", to: .StdErr)
        exit(EXIT_FAILURE)
    }
    
    if (option == OptionType.Help) {
        IO.printUsage()
    } else {
        var res = Die(option: option).roll()
        IO.printMessage("\(res)\n")
    }

default:
    IO.printUsage(.StdErr)
    exit(EXIT_FAILURE)
}

exit(EXIT_SUCCESS)