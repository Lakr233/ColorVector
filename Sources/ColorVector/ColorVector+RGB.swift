//
//  ColorVector+RGB.swift
//  ColorVector
//
//  Created by 秋星桥 on 2024/7/3.
//

import Foundation

extension ColorVector {
  public var rgbo: (r: Double, g: Double, b: Double, o: Double) {
    let rgbColor = color(in: .rgb)
    assert(rgbColor.space == .rgb)
    return (rgbColor.v.x, rgbColor.v.y, rgbColor.v.z, rgbColor.v.w)
  }

  public var rgba: (r: Double, g: Double, b: Double, a: Double) {
    (rgbo.r, rgbo.g, rgbo.b, rgbo.o)
  }

  public var rgb: (r: Double, g: Double, b: Double) {
    (rgbo.r, rgbo.g, rgbo.b)
  }
}
