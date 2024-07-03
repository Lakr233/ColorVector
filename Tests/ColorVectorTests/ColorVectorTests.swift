@testable import ColorVector
import XCTest

final class ColorVectorTests: XCTestCase {
    func checkColorEquation(_ lhs: ColorVector, _ rhs: ColorVector) {
        for i in 0 ..< 4 {
            XCTAssertEqual(lhs.v[i], rhs.v[i], accuracy: 1)
        }
    }
    
    func testConversionMap() throws {
        print("[*] initializing color conversion...")
        ColorConversion.initialize()
        
        var testCount = 0
        for from in ColorVector.Space.allCases {
            for to in ColorVector.Space.allCases {
                testCount += 1
                
                let fromColor = ColorVector(v: .init(
                    Double.random(in: 0 ... 1),
                    Double.random(in: 0 ... 1),
                    Double.random(in: 0 ... 1),
                    Double.random(in: 0 ... 1)
                ), space: from)
                let toColor = ColorConversion.convert(fromColor, to: to)
                let backColor = ColorConversion.convert(toColor, to: from)
                checkColorEquation(fromColor, backColor)
                
                let output = [
                    "[*] test index: \(testCount)",
                    "  > from color space: \(from)",
                    "    v1: \(fromColor.v.x) v2: \(fromColor.v.y) v3: \(fromColor.v.z) v4: \(fromColor.v.w)",
                    "  > to color space: \(to)",
                    "    v1: \(toColor.v.x) v2: \(toColor.v.y) v3: \(toColor.v.z) v4: \(toColor.v.w)",
                    "  > back to color space: \(from)",
                    "    v1: \(backColor.v.x) v2: \(backColor.v.y) v3: \(backColor.v.z) v4: \(backColor.v.w)",
                ].joined(separator: "\n")
                print(output)
                fflush(stdout)
            }
        }
        
        let from = ColorVector.Space.rgb
        for to in ColorVector.Space.allCases {
            for _ in 0 ... 255 {
                testCount += 1
                
                let fromColor = ColorVector(v: .init(
                    Double.random(in: 0 ... 255),
                    Double.random(in: 0 ... 255),
                    Double.random(in: 0 ... 255),
                    Double.random(in: 0 ... 1)
                ), space: from)
                let toColor = ColorConversion.convert(fromColor, to: to)
                let backColor = ColorConversion.convert(toColor, to: from)
                checkColorEquation(fromColor, backColor)
                
                let output = [
                    "[*] test index: \(testCount)",
                    "  > from color space: \(from)",
                    "    v1: \(fromColor.v.x) v2: \(fromColor.v.y) v3: \(fromColor.v.z) v4: \(fromColor.v.w)",
                    "  > to color space: \(to)",
                    "    v1: \(toColor.v.x) v2: \(toColor.v.y) v3: \(toColor.v.z) v4: \(toColor.v.w)",
                    "  > back to color space: \(from)",
                    "    v1: \(backColor.v.x) v2: \(backColor.v.y) v3: \(backColor.v.z) v4: \(backColor.v.w)",
                ].joined(separator: "\n")
                print(output)
                fflush(stdout)
            }
        }
        
        usleep(500)
    }
}

//private extension ColorVector.Space {
//    typealias ValidRange = ClosedRange<Double>
//    typealias VectorForClosedRange4 = (
//        ValidRange?,
//        ValidRange?,
//        ValidRange?,
//        ValidRange?
//    )
//    
//    /*
//        // from https://aloso.github.io/colo/color_spaces.html
//        rgb            red, green, blue                        0 to 255
//        lab            CIELAB (lightness, a, b)                lightness: 0 to 100
//        lch            CIELCh (luminance, chroma, hue)         luminance: 0 to 100, chroma: 0 to 100, hue: 0 to 360
//        xyz            CIE XYZ (x, lightness, z)               lightness: 0 to 100
//     */
//    
//    var validatedRange: VectorForClosedRange4? {
//        switch self {
//        case .rgb:
//            return (0 ... 255, 0 ... 255, 0 ... 255, 0 ... 1)
//        case .lch:
//            return (0 ... 100, 0 ... 100, 0 ... 360, 0 ... 1)
//        case .lab:
//            return (0 ... 100, nil, nil, 0 ... 1)
//        case .xyz:
//            return (0 ... 100, nil, nil, 0 ... 1)
//        }
//        
//    }
//}
