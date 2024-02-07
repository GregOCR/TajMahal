//
//  AppFont.swift
//  TajMahal
//
//  Created by Greg on 17/01/2024.
//

// enumération répertoriant les typos de l'App
enum AppFont {
    case plusJakartaSans_400,
         plusJakartaSans_600,
         plusJakartaSans_700
    
    // méthode permettant de return le nom de la typo pour chaque cas d'énumération
    func getFontName() -> String {
        switch self {
        case .plusJakartaSans_400:
            return "PlusJakartaSans-Regular"
        case .plusJakartaSans_600:
            return "PlusJakartaSans-SemiBold"
        case .plusJakartaSans_700:
            return "PlusJakartaSans-Bold"
        }
    }
}
