//
//  SpiceViewModel.swift
//  TajMahal
//
//  Created by Amandine Cousin on 07/11/2023.
//  Modified by Greg on 14/01/2024.
//

// Structure qui gère toute la logique du code
// Fait l'intermédiaire entre l'affichage et les données
struct SpiceViewModel {
    
    // renvoie un Bool permettant de savoir si un cas de SpiceLevel est .medium
    func isSpiceMediumLevel(_ spiceLevel: SpiceLevel) -> Bool {
        return spiceLevel == .medium
    }
    // renvoie un Bool permettant de savoir si un cas de SpiceLevel est .hot
    func isSpiceHotLevel(_ spiceLevel: SpiceLevel) -> Bool {
        return spiceLevel == .hot
    }
}
