//
//  AppColor.swift
//  TajMahal
//
//  Created by Greg on 15/01/2024.
//

import SwiftUI

// enumération répertoriant les couleurs de l'App
enum AppColor {
    case customRed,
         customUltraLightContrast,
         customLightContrast,
         customMiddleContrast,
         customHighContrast,
         customExtremContrast
    
    // méthode permettant de return un object Color pour chaque cas d'énumération
    func asColor() -> Color {
        switch self {
        case .customRed:
            return Color("CustomRed")
        case .customUltraLightContrast:
            return Color("customUltraLightContrast") // ici le ultra light contrast
        case .customLightContrast:
            return Color("customLightContrast")
        case .customMiddleContrast:
            return Color("customMiddleContrast")
        case .customHighContrast:
            return Color("customHighContrast")
        case .customExtremContrast:
            return Color("customExtremContrast")
        }
    }
}
