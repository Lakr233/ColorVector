//
//  ColorConversion+RGB_XYZ.swift
//  ColorVector
//
//  Created by 秋星桥 on 2024/7/4.
//

import Foundation

extension ColorConversion {
    static func convert_from_rgb_to_xyz(_ rgbVector: ColorVector) -> ColorVector {
        assert(rgbVector.space == .rgb)

        var r = rgbVector.v.x / 255
        var g = rgbVector.v.y / 255
        var b = rgbVector.v.z / 255
        let a = rgbVector.v.w

        if r > 0.04045 {
            r = pow((r + 0.055) / 1.055, 2.4)
        } else {
            r = r / 12.92
        }
        if g > 0.04045 {
            g = pow((g + 0.055) / 1.055, 2.4)
        } else {
            g = g / 12.92
        }
        if b > 0.04045 {
            b = pow((b + 0.055) / 1.055, 2.4)
        } else {
            b = b / 12.92
        }
        r *= 100
        g *= 100
        b *= 100

        let x = r * 0.4124 + g * 0.3576 + b * 0.1805
        let y = r * 0.2126 + g * 0.7152 + b * 0.0722
        let z = r * 0.0193 + g * 0.1192 + b * 0.9505

        return .init(v: .init(x, y, z, a), space: .xyz)
    }
}
