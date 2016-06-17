//
//  IO.swift
//  Do
//
//  Created by Marc on 16/06/2016.
//  Copyright © 2016 mc7h. All rights reserved.
//

import Foundation

enum OutputType {
    case StdErr
    case StdOut
}

enum OptionType {
    case Help
    case DFour
    case DSix
    case DEight
    case DTen
    case DTwelve
    case DTwenty
    case Unknown
    
    init(value: String) {
        switch value {
        case "-h", "--help": self = .Help
        case "d4": self = .DFour
        case "d6": self = .DSix
        case "d8": self = .DEight
        case "d10": self = .DTen
        case "d12": self = .DTwelve
        case "d20": self = .DTwenty
        default: self = .Unknown
        }
    }
}

class IO {
    
    class func executableName() -> String {
        return (Process.arguments.first! as NSString).lastPathComponent
    }
    
    class func printUsage(to: OutputType = .StdOut) {
        IO.printMessage("usage: \(executableName()) [dice_type]\n", to: to)
        
        // Remember to line up additional usages with spaces:
        // IO.printMessage("       \(executableName()) -h --help\n", to: to)
    }
    
    class func printMessage(message: String, to: OutputType = .StdOut) {
        switch to {
        case .StdOut:
            if let data = message.dataUsingEncoding(NSUTF8StringEncoding) {
                NSFileHandle.fileHandleWithStandardOutput().writeData(data)
            }
        case .StdErr:
            if let data = message.dataUsingEncoding(NSUTF8StringEncoding) {
                NSFileHandle.fileHandleWithStandardError().writeData(data)
            }
        }
    }
    
    class func getOption(option: String) -> (option:OptionType, value: String) {
        return (OptionType(value: option), option)
    }
}