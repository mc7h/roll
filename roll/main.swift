//
//  main.swift
//  roll
//
//  Created by Marc on 16/06/2016.
//  Copyright © 2016 mc7h. All rights reserved.
//

import Foundation

switch CommandLine.arguments.count {
case 1:
    var res = Die(withOption: .dSix).roll()
    IO.print(message: "\(res)\n")

case 2:
    let (option, value) = IO.value(fromOption: CommandLine.arguments[1])
    
    guard (option != OptionType.unknown) else {
        IO.print(message:"\(IO.executableName()): illegal dice type - '\(value)'. Try d4, d6, d20 etc.\n", toStream: .stdErr)
        exit(EXIT_FAILURE)
    }
    
    if (option == OptionType.help) {
        IO.printUsage()
    } else {
        var res = Die(withOption: option).roll()
        IO.print(message:"\(res)\n")
    }

default:
    IO.printUsage(toStream:.stdErr)
    exit(EXIT_FAILURE)
}

exit(EXIT_SUCCESS)
