//
//  Random.swift
//
//  A collection of useful Random utilities.
//  - note: Sourced from https://gist.github.com/erica/aa0b1164fd82d98d73c58919d3155984
//
//  Modified to prevent overflow.
//

import Foundation
#if os(Linux)
    import Glibc
#endif

/// A cross-platform API for random number generation.
public struct Random {
    
    #if os(Linux)
    private static var initialized = false
    #endif
    
    /// Generate a new random number.
    ///
    /// - Parameter max: The maximum value of the random number.
    /// - Returns: A randomly generated number.
    public static func generate(max: Int32 = Int32.max) -> Int {
        #if os(Linux)
            if !Random.initialized {
                srandom(UInt32(time(nil)))
                Random.initialized = true
            }
            return Int(random() % Int(max))
        #else
            return Int(arc4random_uniform(UInt32(max)))
        #endif
    }
}
