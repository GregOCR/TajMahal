//
//  SpiceLevelCapsule.swift
//  TajMahal
//
//  Created by Greg on 16/01/2024.
//

import SwiftUI

// structure qui affiche une capsule blanche avec à l'intérieur la VisualSpiceLevel qui indique le niveau d'épice atteint par le plat
struct SpiceLevelCapsule: View {
    
    var spiceLevel: SpiceLevel // prend en paramètre le niveau d'épice du plat
    var size: PictoSize // prend en paramètre la taille du picto selon son type

    var body: some View {
        VisualSpiceLevel(spiceLevel: spiceLevel,
                         size: size) // affiche les piments représentant graphiquement le niveau d'épice atteint par le plat
            .padding(5) // admet une marge tournante de 5
            .padding([.leading, .trailing], 5) // rajoute une marge intérieur supplémentaire de 5 à gauche et à droite dans la capsule
            .background(AppColor.customExtremContrast.asColor()) // affiche un fond blanc
            .cornerRadius(20) // arrondi les angles
    }
}

#Preview {
    SpiceLevelCapsule(spiceLevel: .medium,
                      size: .detailsViewSize)
}
