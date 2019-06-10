//
//  SystemColors.swift
//  NGSystemColorComparison
//
//  Created by Noah Gilmore on 6/9/19.
//  Copyright © 2019 Noah Gilmore. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return (red: red, green: green, blue: blue, alpha: alpha)
    }

    var red: CGFloat {
        return self.rgba.red
    }

    var blue: CGFloat {
        return self.rgba.blue
    }

    var green: CGFloat {
        return self.rgba.green
    }

    var alpha: CGFloat {
        return self.rgba.alpha
    }

    func toHexString() -> String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0

        getRed(&r, green: &g, blue: &b, alpha: &a)

        let rgb: Int = (Int)(r*255) << 24 | (Int)(g*255) << 16 | (Int)(b*255) << 8 | (Int)(a*255) << 0

        let string = String(format:"#%08x", rgb)
        return string
    }

    func toRGBAString() -> String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0

        getRed(&r, green: &g, blue: &b, alpha: &a)

        return "rgba(\(r*255), \(g*255), \(b*255), \(a))"
    }
}

struct CodableSystemColor: Codable {
    let name: String
    let hexString: String
    let rgbaString: String
}

struct SystemColor {
    let name: String
    let color: UIColor

    var codableRepresentation: CodableSystemColor {
        return CodableSystemColor(
            name: self.name,
            hexString: self.color.toHexString(),
            rgbaString: self.color.toRGBAString()
        )
    }

    var hexDescription: String {
        return self.color.toHexString()
    }

    var uiColorDescription: String {
        return "UIColor(red: \(color.red), green: \(color.green), blue: \(color.blue), alpha: \(color.alpha))"
    }

    var parameterDescription: String {
        return """
            static var \(name): UIColor {
                if #available(iOS 13, *) {
                    return .\(name)
                }
                return \(uiColorDescription)
            }
        """
    }

    static var extensionDescription: String {
        return """
        enum ColorCompatibility {
            \(Self.colors.map { $0.parameterDescription }.joined(separator: "\n"))
        }
        """
    }

    static var colors: [SystemColor] {
        return  [
        SystemColor(name: "label", color: .label),
        SystemColor(name: "secondaryLabel", color: .secondaryLabel),
        SystemColor(name: "tertiaryLabel", color: .tertiaryLabel),
        SystemColor(name: "quaternaryLabel", color: .quaternaryLabel),
        SystemColor(name: "systemFill", color: .systemFill),
        SystemColor(name: "secondarySystemFill", color: .secondarySystemFill),
        SystemColor(name: "tertiarySystemFill", color: .tertiarySystemFill),
        SystemColor(name: "quaternarySystemFill", color: .quaternarySystemFill),
        SystemColor(name: "placeholderText", color: .placeholderText),
        SystemColor(name: "systemBackground", color: .systemBackground),
        SystemColor(name: "secondarySystemBackground", color: .secondarySystemBackground),
        SystemColor(name: "tertiarySystemBackground", color: .tertiarySystemBackground),
        SystemColor(name: "systemGroupedBackground", color: .systemGroupedBackground),
        SystemColor(name: "secondarySystemGroupedBackground", color: .secondarySystemGroupedBackground),
        SystemColor(name: "tertiarySystemGroupedBackground", color: .tertiarySystemGroupedBackground),
        SystemColor(name: "separator", color: .separator),
        SystemColor(name: "opaqueSeparator", color: .opaqueSeparator),
        SystemColor(name: "link", color: .link),
        SystemColor(name: "darkText", color: .darkText),
        SystemColor(name: "lightText", color: .lightText),
        SystemColor(name: "systemBlue", color: .systemBlue),
        SystemColor(name: "systemBrown", color: .systemBrown),
        SystemColor(name: "systemGreen", color: .systemGreen),
        SystemColor(name: "systemIndigo", color: .systemIndigo),
        SystemColor(name: "systemOrange", color: .systemOrange),
        SystemColor(name: "systemPink", color: .systemPink),
        SystemColor(name: "systemPurple", color: .systemPurple),
        SystemColor(name: "systemRed", color: .systemRed),
        SystemColor(name: "systemTeal", color: .systemTeal),
        SystemColor(name: "systemYellow", color: .systemYellow),
        SystemColor(name: "systemGray", color: .systemGray),
        SystemColor(name: "systemGray2", color: .systemGray2),
        SystemColor(name: "systemGray3", color: .systemGray3),
        SystemColor(name: "systemGray4", color: .systemGray4),
        SystemColor(name: "systemGray5", color: .systemGray5),
        SystemColor(name: "systemGray6", color: .systemGray6)
        ]
    }
}
