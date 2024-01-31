//
//  DishDetailsView.swift
//  TajMahal
//
//  Created by Greg on 16/01/2024.
//

import SwiftUI

// structure qui affiche les détails d'un repas
struct DishDetailsView: View {
    
    var dish: Dish // prend en paramètre le repas à afficher
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading) {
                DishImageView(imageName: dish.imageName,
                              spiceLevel: dish.spiceLevel)
                .padding(.bottom, 30)
                TextBlocView(title: "Allergènes :",
                             content: dish.allergens)
                Divider()
                    .background(.white)
                    .padding([.top, .bottom])
                TextBlocView(title: "Ingrédients :",
                             content: dish.ingredients)
            }
        }
        .padding(20)
        .foregroundStyle(AppColor.customMiddleContrast.asColor()) // couleur de l'ensemble du texte de la view
    }
}

struct DishImageView: View {
    
    var imageName : String
    var spiceLevel: SpiceLevel
    
    var body: some View {
        ZStack(alignment: .top) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipped()
                .frame(height: 500)
                .frame(minWidth: .zero)
            HStack {
                Spacer()
                SpiceLevelCapsule(spiceLevel: spiceLevel,
                                  size: .detailsViewSize)
            }
            .padding(15)
        }
        .cornerRadius(10)
    }
}

struct TextBlocView: View {
    
    var title: String
    var content: String
    
    var body: some View {
        
        let viewFontSize: CGFloat = 15 // paramètrage de la taille des typos du bloc texte
        
        Text(title)
            .padding(.bottom, 5)
            .font(.custom(AppFont.plusJakartaSans_600.getFontName(),
                          size: viewFontSize))
        Text(content)
            .font(.custom(AppFont.plusJakartaSans_400.getFontName(),
                          size: viewFontSize))
    }
}

#Preview {
    DishDetailsView(dish: appetizers.0.first!)
}
