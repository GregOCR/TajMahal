//
//  ChiliPicto.swift
//  TajMahal
//
//  Created by Greg on 15/01/2024.
//

import SwiftUI

// enumération qui répertorie les différents types de taille pour les pictos
enum PictoSize: CGFloat {
    
    case rowViewSize = 14,
         detailsViewSize = 17
}

// structure qui affiche un piment avec en paramètre sa couleur à définir
struct ChiliPicto: View {
    
    var color: AppColor // prend en paramètre une couleur
    var size: PictoSize // prend en paramètre une taille
    
    var body: some View {
        Image("chili") // image du piment
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: size.rawValue,
                   height: size.rawValue)
            .foregroundStyle(color.asColor()) // colorise l'image selon la couleur en paramètre
    }
}

#Preview {
    ChiliPicto(color: .customLightContrast,
               size: .rowViewSize)
}
