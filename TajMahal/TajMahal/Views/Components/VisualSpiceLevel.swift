//
//  VisualSpiceLevel.swift
//  TajMahal
//
//  Created by Greg on 16/01/2024.
//

import SwiftUI

// structure qui permet d'afficher le niveau d'épice par représentation graphique de 3 piments. La couleur rouge indiquant la force atteinte du plat
struct VisualSpiceLevel: View {
    
    var spiceLevel: SpiceLevel // prend en paramètre le niveau d'épice du plat
    var size: PictoSize // prend en paramètre la taille du picto selon son type
    
    var body: some View {
        
        let spiceViewModel = SpiceViewModel() // permet d'accéder au ViewModel des épices qui contient les méthodes nécessaires à la page
        
        HStack {
            ChiliPicto(color: .customRed,
                       size: size) // affiche un piment rouge par défaut, représentant le niveau 1 (light) de force d'épice, qui est le minimum pour un plat
            ChiliPicto(color: spiceViewModel.isSpiceMediumLevel(spiceLevel) || spiceViewModel.isSpiceHotLevel(spiceLevel) ? .customRed : .customUltraLightContrast,
                       size: size) // affiche un piment rouge si le niveau 2 (medium) ou niveau 3 (hot) de force d'épice est atteint, sinon un piment gris très clair sera affiché
            ChiliPicto(color: spiceViewModel.isSpiceHotLevel(spiceLevel) ? .customRed : .customUltraLightContrast,
                       size: size) // affiche un piment rouge si le niveau 3 (hot) de force d'épice est atteint, sinon un piment gris très clair sera affiché
        }
    }
}

#Preview {
    VisualSpiceLevel(spiceLevel: .hot,
                     size: .rowViewSize)
}
