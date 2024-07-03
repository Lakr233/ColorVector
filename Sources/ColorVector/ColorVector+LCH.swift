//
//  ColorVector+LCH.swift
//  ColorVector
//
//  Created by 秋星桥 on 2024/7/3.
//

import Foundation

extension ColorVector {
    var lcho: (l: Double, c: Double, h: Double, o: Double) {
        let lchColor = color(in: .lch)
        assert(lchColor.space == .lch)
        return (lchColor.v.x, lchColor.v.y, lchColor.v.z, lchColor.v.w)
    }

    var lcha: (l: Double, c: Double, h: Double, a: Double) {
        (lcho.l, lcho.c, lcho.h, lcho.o)
    }

    var lch: (l: Double, c: Double, h: Double) {
        (lcho.l, lcho.c, lcho.h)
    }
}
