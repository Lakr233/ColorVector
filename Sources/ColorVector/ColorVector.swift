//
//  ColorVector.swift
//  ColorVector
//
//  Created by 秋星桥 on 2024/7/3.
//

import Foundation

public struct ColorVector: Codable, Equatable, Hashable {
    public var v: SIMD4<Double>
    public var opacity: Double { v.w }

    public enum Space: String, Codable, Equatable, Hashable, CaseIterable {
        case rgb
        case lch
        case lab
        case xyz
    }

    public var space: Space

    public init(v: SIMD4<Double> = .init(0, 0, 0, 0), space: Space = .rgb) {
        self.v = v
        self.space = space
    }
}

extension ColorVector {
    func color(in space: Space) -> Self {
        ColorConversion.convert(self, to: space)
    }
}

/*

 // from https://aloso.github.io/colo/color_spaces.html
 rgb            red, green, blue                        0 to 255
 lab            CIELAB (lightness, a, b)                lightness: 0 to 100
 lch            CIELCh (luminance, chroma, hue)         luminance: 0 to 100, chroma: 0 to 100, hue: 0 to 360
 xyz            CIE XYZ (x, lightness, z)               lightness: 0 to 100

 // for your ref
 cmy            cyan, magenta, yellow                   0 to 1
 cmyk           cyan, magenta, yellow, key              0 to 1
 hsl            hue, saturation, light                  hue: 0 to 360, saturation: 0 to 1, light: 0 to 1
 hsv            hue, saturation, value                  hue: 0 to 360, saturation: 0 to 1, value: 0 to 1
 luv            CIELUV (luminance, u, v)                luminance: 0 to 100, u: -134 to 220, v: -140 to 122
 yxy            CIE Yxy (lightness, x, y)               lightness: 0 to 100
 gry            Grayscale (light)                       light: 0 to 1

 */
