//
//  ColorVector+LCH.swift
//  ColorVector
//
//  Created by 秋星桥 on 2024/7/3.
//

import Foundation

extension ColorVector {
  public var lcho: (l: Double, c: Double, h: Double, o: Double) {
    let lchColor = color(in: .lch)
    assert(lchColor.space == .lch)
    return (lchColor.v.x, lchColor.v.y, lchColor.v.z, lchColor.v.w)
  }

  public var lcha: (l: Double, c: Double, h: Double, a: Double) {
    (lcho.l, lcho.c, lcho.h, lcho.o)
  }

  public var lch: (l: Double, c: Double, h: Double) {
    (lcho.l, lcho.c, lcho.h)
  }
}
