//
//  IO.swift
//  Do
//
//  Created by Marc on 16/06/2016.
//  Copyright © 2016 mc7h. All rights reserved.
//

import Foundation

enum OutputType {
    case stdErr
    case stdOut
}

enum OptionType {
    case help
    case dFour
    case dSix
    case dEight
    case dTen
    case dTwelve
    case dTwenty
    case unknown
    
    init(value: String) {
        switch value {
        case "-h", "--help": self = .help
        case "d4": self = .dFour
        case "d6": self = .dSix
        case "d8": self = .dEight
        case "d10": self = .dTen
        case "d12": self = .dTwelve
        case "d20": self = .dTwenty
        default: self = .unknown
        }
    }
}

class IO {
    
    class func executableName() -> String {
        return (Process.arguments.first! as NSString).lastPathComponent
    }
    
    class func printUsage(toStream: OutputType = .stdOut) {
        IO.print(message: "usage: \(executableName()) [dice_type]\n", toStream: toStream)
        
        // Remember to line up additional usages with spaces:
        // IO.printMessage("       \(executableName()) -h --help\n", to: to)
    }
    
    class func print(message: String, toStream: OutputType = .stdOut) {
        switch toStream {
        case .stdOut:
            if let data = message.data(using: String.Encoding.utf8) {
                FileHandle.standardOutput.write(data)
                
            }
        case .stdErr:
            if let data = message.data(using: String.Encoding.utf8) {
                FileHandle.standardError.write(data)
            }
        }
    }
    
    class func value(fromOption option: String) -> (option:OptionType, value: String) {
        return (OptionType(value: option), option)
    }
}
