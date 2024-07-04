//
//  ColorVector+LAB.swift
//  ColorVector
//
//  Created by 秋星桥 on 2024/7/3.
//

import Foundation

public extension ColorVector {
    var labo: (l: Double, a: Double, b: Double, o: Double) {
        let labColor = color(in: .lab)
        assert(labColor.space == .lab)
        return (labColor.v.x, labColor.v.y, labColor.v.z, labColor.v.w)
    }

//    sorry, duplicated a :P
//    var laba: (l: Double, a: Double, b: Double, a: Double) {
//        (labo.l, labo.a, labo.b, labo.o)
//    }

    var lab: (l: Double, a: Double, b: Double) {
        (labo.l, labo.a, labo.b)
    }
}
