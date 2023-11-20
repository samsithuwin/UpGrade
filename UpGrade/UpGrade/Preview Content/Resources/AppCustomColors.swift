//
//  AppCustomColors.swift
//  UpGrade
//
//  Created by Victor Rodriguez on 11/20/23.
//

import Foundation
import SwiftUI

extension Color {
    static func appColor() -> Color {
        return Color(red: 17/255.0, green: 34/255.0, blue: 84/255.0)
    }
    
    // Dark blue
    static func appColors() -> Color {
        return Color(red: 25/255.0, green: 45/255.0, blue: 114/255.0)
    }
    
  
    
    static func buttoncolor() -> Color {
        return Color(red: 196/255.0, green: 196/255.0, blue: 196/255.0)
    }


    
    static let body_text = Color("Body_Text")
    static let dark_blue = Color("Header_Color")
    static let light_gray = Color("Sheet_Color")
    static let button_color = Color("Button_Color")
}

struct CustomColor {
    static let myColor = Color("myColor")
}

