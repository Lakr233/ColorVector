//
//  ColorConversion+LCH_LAB.swift
//  ColorVector
//
//  Created by 秋星桥 on 2024/7/4.
//

import Foundation

extension ColorConversion {
    static func convert_from_lch_to_lab(_ lchVector: ColorVector) -> ColorVector {
        assert(lchVector.space == .lch)

        let l = lchVector.v.x
        let c = lchVector.v.y
        let h = lchVector.v.z
        let opacity = lchVector.v.w

        let a = cos(h * 0.01745329251) * c
        let b = sin(h * 0.01745329251) * c

        return .init(v: .init(l, a, b, opacity), space: .lab)
    }
}
