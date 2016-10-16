[![Build Status](https://travis-ci.org/mc7h/roll.svg?branch=master)](https://travis-ci.org/mc7h/roll) [![codebeat badge](https://codebeat.co/badges/69e9dc31-8425-4f30-9641-ee88d444c2a7)](https://codebeat.co/projects/github-com-mc7h-roll)

# roll (swift + cli + dice)

**roll** is a command-line tool written in Swift that allows you to roll D&D dice.

~~~ sh
# to roll a 6-sided die (d6)
$ roll 

# to roll a 20-sided die (d20)
$ roll d20

# view help
$ roll -h
$ roll --help
~~~

roll is CLI compliant; for example:

~~~ sh
# to store output in a variable
$ var=$(roll) 

# to pipe output into another program
$ roll d20 | pbcopy 

# to redirect output to a file
$ roll d4 > foo.txt
~~~


## Compilation

Requires Xcode 8 / Swift 3.
The .xcodeproj is included. However, if you want to compile from the command-line use:

~~~ sh
$ cd roll
$ xcrun -sdk macosx swiftc main.swift IO.swift Int+Rng.swift Die.swift -o roll
~~~

## Disclaimer

I appreciate that roll is probably not a tool that anybody would want or need ;) ... I built it in order to assess the command-line capabilities of Swift apps and Swift's suitability for tool development.

In practice, roll is a fairly complete reference app to assist others want to learn how to build their own command-line apps in Swift.
