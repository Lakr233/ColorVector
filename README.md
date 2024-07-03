# ColorVector

Used for color with conversion between different color spaces.

## Platform

Works on `Foundation` available devices. Should work on all Swift supported platforms.

## Usage

Add this package into your project.

```swift
dependencies: [
    .package(url: "https://github.com/Lakr233/ColorVector.git", from: "1.0.0"),
]
```

Then you can use it like this:

```swift
import ColorVector

let colorVectorRGB = ColorVector(v: .init(
    Double.random(in: 0 ... 255),
    Double.random(in: 0 ... 255),
    Double.random(in: 0 ... 255),
    Double.random(in: 0 ... 1)
), space: .rgb)
let someLCHColor = colorVectorRGB.lch
let someLABColor = colorVectorRGB.lab
let someXYZColor = colorVectorRGB.xyz
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Copyright © 2023 Lakr Aream. All Rights Reserved.
