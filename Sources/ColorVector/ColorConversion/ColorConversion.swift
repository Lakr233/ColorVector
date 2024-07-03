//
//  ColorConversion.swift
//  ColorVector
//
//  Created by 秋星桥 on 2024/7/4.
//

import Foundation

public enum ColorConversion {
    /// The tuple of two color spaces, used to identify the conversion function chain
    struct SpaceTuple: Codable, Equatable, Hashable {
        /// source color space
        let from: ColorVector.Space
        /// target color space
        let to: ColorVector.Space
    }

    /// initialize the function map using dfs search
    /// will be called automatically if you call convert
    public static func initialize() {
        _ = functionMap
    }

    /// Convert color from one space to another
    /// - Parameters:
    ///   - color: input
    ///   - to: target color space
    /// - Returns: color in target space
    public static func convert(_ color: ColorVector, to: ColorVector.Space) -> ColorVector {
        let tuple = SpaceTuple(from: color.space, to: to)
        guard let functionChain = functionMap[tuple] else {
            fatalError()
        }
        var currentValue = color
        for function in functionChain {
            currentValue = function(currentValue)
        }
        assert(currentValue.space == to)
        return currentValue
    }
}

private extension ColorConversion {
    private typealias ConversionFunction = (ColorVector) -> ColorVector
    private typealias ConversionFunctionChain = [ColorConversion.ConversionFunction]

    private static let initialFunctionMap: [SpaceTuple: ConversionFunction] = [
        .init(from: .lch, to: .lab): convert_from_lch_to_lab,
        .init(from: .lab, to: .xyz): convert_from_lab_to_xyz,
        .init(from: .xyz, to: .rgb): convert_from_xyz_to_rgb,
        .init(from: .rgb, to: .xyz): convert_from_rgb_to_xyz,
        .init(from: .xyz, to: .lab): convert_from_xyz_to_lab,
        .init(from: .lab, to: .lch): convert_from_lab_to_lch,
    ]

    private static let functionMap: [SpaceTuple: ConversionFunctionChain] = {
        var map = initialFunctionMap
        for eachCase in ColorVector.Space.allCases {
            map[.init(from: eachCase, to: eachCase)] = convert_from_self_to_self
        }

        // dfs search will result a queue of function used for conversion
        // store the searched path, space is target
        var searched: [SpaceTuple: ConversionFunctionChain] = [:]

        func dfs_search(_ from: ColorVector.Space, _ space: ColorVector.Space, _ chain: ConversionFunctionChain) {
            let tuple = SpaceTuple(from: from, to: space)
            if let currentChain = searched[tuple] {
                // if already visited and has shorter path for this space, ignore sub path
                if currentChain.count < chain.count {
                    return
                }
            }

            // we are in a shored path, update the chain
            searched[tuple] = chain

            // continue search to find possible shorter path
            // current chain contains is from `from` to `space`
            for possibleNext in ColorVector.Space.allCases {
                let nextTuple = SpaceTuple(from: space, to: possibleNext)
                guard let function = map[nextTuple] else { continue }
                let nextQueue = chain + [function]
                dfs_search(from, possibleNext, nextQueue)
            }
        }

        for fromValue in ColorVector.Space.allCases {
            for toValue in ColorVector.Space.allCases {
                let tuple = SpaceTuple(from: fromValue, to: toValue)
                if let initialPath = map[tuple] {
                    dfs_search(fromValue, toValue, [initialPath])
                }
            }
        }
        return searched
    }()

    static func convert_from_self_to_self(_ vector: ColorVector) -> ColorVector {
        vector
    }
}
