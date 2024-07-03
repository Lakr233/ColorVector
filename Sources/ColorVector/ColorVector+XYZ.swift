//
//  ColorVector+XYZ.swift
//  ColorVector
//
//  Created by 秋星桥 on 2024/7/3.
//

import Foundation

extension ColorVector {
    var xyzo: (x: Double, y: Double, z: Double, o: Double) {
        let xyzColor = color(in: .xyz)
        assert(xyzColor.space == .xyz)
        return (xyzColor.v.x, xyzColor.v.y, xyzColor.v.z, xyzColor.v.w)
    }

    var xyza: (x: Double, y: Double, z: Double, a: Double) {
        (xyzo.x, xyzo.y, xyzo.z, xyzo.o)
    }

    var xyz: (x: Double, y: Double, z: Double) {
        (xyzo.x, xyzo.y, xyzo.z)
    }
}
