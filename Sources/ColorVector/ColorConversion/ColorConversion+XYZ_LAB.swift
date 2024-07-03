//
//  ColorConversion+XYZ_LAB.swift
//  ColorVector
//
//  Created by 秋星桥 on 2024/7/4.
//

import Foundation

extension ColorConversion {
    static func convert_from_xyz_to_lab(_ xyzVector: ColorVector) -> ColorVector {
        assert(xyzVector.space == .xyz)

        var vx = xyzVector.v.x / 95.047
        var vy = xyzVector.v.y / 100.000
        var vz = xyzVector.v.z / 108.883
        let va = xyzVector.v.w

        if vx > 0.008856 {
            vx = pow(vx, 0.333333333)
        } else {
            vx = 7.787 * vx + 0.137931034
        }

        if vy > 0.008856 {
            vy = pow(vy, 0.333333333)
        } else {
            vy = 7.787 * vy + 0.137931034
        }

        if vz > 0.008856 {
            vz = pow(vz, 0.333333333)
        } else {
            vz = 7.787 * vz + 0.137931034
        }

        let l = (116.0 * vy) - 16.0
        let a = 500.0 * (vx - vy)
        let b = 200.0 * (vy - vz)

        return .init(v: .init(l, a, b, va), space: .lab)
    }
}
