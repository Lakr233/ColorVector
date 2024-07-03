//
//  ColorConversion+LAB_LCH.swift
//  ColorVector
//
//  Created by 秋星桥 on 2024/7/4.
//

import Foundation

extension ColorConversion {
    static func convert_from_lab_to_lch(_ labVector: ColorVector) -> ColorVector {
        assert(labVector.space == .lab)

        let l = labVector.v.x
        let a = labVector.v.y
        let b = labVector.v.z
        let o = labVector.v.w

        let c = sqrt(pow(a, 2) + pow(b, 2))

        var h = atan2(b, a)
        if h > 0 {
            h = (h / .pi) * 180
        } else {
            h = 360 - (abs(h) / .pi) * 180
        }

        return .init(v: .init(l, c, h, o), space: .lch)
    }
}
