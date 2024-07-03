//
//  ColorConversion+XYZ_RGB.swift
//  ColorVector
//
//  Created by 秋星桥 on 2024/7/4.
//

import Foundation

extension ColorConversion {
    static func convert_from_xyz_to_rgb(_ xyzVector: ColorVector) -> ColorVector {
        assert(xyzVector.space == .xyz)

        let x = xyzVector.v.x / 100
        let y = xyzVector.v.y / 100
        let z = xyzVector.v.z / 100
        let opacity = xyzVector.v.w

        var r = x * 3.2406 + y * -1.5372 + z * -0.4986
        var g = x * -0.9689 + y * 1.8758 + z * 0.0415
        var b = x * 0.0557 + y * -0.2040 + z * 1.0570

        if r > 0.0031308 {
            r = 1.055 * pow(r, 0.41666667) - 0.055
        } else {
            r = 12.92 * r
        }

        if g > 0.0031308 {
            g = 1.055 * pow(g, 0.41666667) - 0.055
        } else {
            g = 12.92 * g
        }

        if b > 0.0031308 {
            b = 1.055 * pow(b, 0.41666667) - 0.055
        } else {
            b = 12.92 * b
        }

        r *= 255
        g *= 255
        b *= 255

        return .init(v: .init(r, g, b, opacity), space: .rgb)
    }
}
