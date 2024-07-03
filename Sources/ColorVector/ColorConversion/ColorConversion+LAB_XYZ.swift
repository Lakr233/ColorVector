//
//  ColorConversion+LAB_XYZ.swift
//  ColorVector
//
//  Created by 秋星桥 on 2024/7/4.
//

import Foundation

extension ColorConversion {
    static func convert_from_lab_to_xyz(_ labVector: ColorVector) -> ColorVector {
        assert(labVector.space == .lab)

        let l = labVector.v.x
        let a = labVector.v.y
        let b = labVector.v.z
        let opacity = labVector.v.w

        var y = (l + 16) / 116
        var x = a / 500 + y
        var z = y - b / 200

        if pow(y, 3) > 0.008856 {
            y = pow(y, 3)
        } else {
            y = (y - 0.137931034) / 7.787
        }

        if pow(x, 3) > 0.008856 {
            x = pow(x, 3)
        } else {
            x = (x - 0.137931034) / 7.787
        }

        if pow(z, 3) > 0.008856 {
            z = pow(z, 3)
        } else {
            z = (z - 0.137931034) / 7.787
        }

        x = 95.047 * x
        y = 100.000 * y
        z = 108.883 * z

        return .init(v: .init(x, y, z, opacity), space: .xyz)
    }
}
