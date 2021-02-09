//
//  Color+Codable.swift
//  Scrumdinger
//
//  Created by hiraoka on 2021/02/07.
//

import SwiftUI

extension Color {
    
    static var random: Color {
        let red = Double.random(in: 0...1)
        let green = Double.random(in: 0...1)
        let blue = Double.random(in: 0...1)
        return Color(.sRGB, red: red, green: green, blue: blue, opacity: 1)
    }
    
    var accessibleFontColor: Color {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        // set color components (value of red, green and blue)
        UIColor(self).getRed(&red, green: &green, blue: &blue, alpha: nil)
        
        return isLightColor(red: red, green: green, blue: blue) ? .black : .white
    }
    
    private func isLightColor(red: CGFloat, green: CGFloat, blue: CGFloat) -> Bool {
        let lightRed = red > 0.65
        let lightGreen = green > 0.65
        let lightBlue = blue > 0.65
        
//        let lightness = [lightRed, lightGreen, lightBlue].reduce(0) { $1 ? $0 + 1 : $0 }
//        return lightness >= 2
        
        return [lightRed, lightGreen, lightBlue].filter { $0 }.count >= 2
    }
    
}
