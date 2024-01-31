//
//  DishRow.swift
//  TajMahal
//
//  Created by Greg on 15/01/2024.
//

import SwiftUI

// structure représentant la view d'une row avec un résumé du plat
struct DishRow: View {
    
    var dish: Dish // prend en paramètre les données du plat à afficher
    
    var body: some View {
        HStack {
            Image(dish.imageName) // vignette image du plat
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 140, height: 110)
                .cornerRadius(10)
                .padding(.trailing, 10)
            VStack(alignment: .leading) {
                Text(dish.name) // nom du plat
                    .font(.custom(AppFont.plusJakartaSans_600.getFontName(),
                                  size: 16))
                Spacer()
                Text(dish.description) // description du plat
                    .font(.custom(AppFont.plusJakartaSans_400.getFontName(),
                                  size: 14))
                Spacer()
                HStack(alignment: .bottom) {
                    Text(dish.price.formatedPrice()) // prix du plat
                        .font(.custom(AppFont.plusJakartaSans_600.getFontName(),
                                      size: 14))
                    Spacer()
                    VisualSpiceLevel(spiceLevel: dish.spiceLevel, // niveau d'épices
                                     size: .rowViewSize)
                }
            }
            .foregroundStyle(AppColor.customMiddleContrast.asColor())
        }
        .frame(height: 110)
    }
}

// extension permettant de return un prix en euros avec 2 chiffres après la virgule sous forme de String, à partir d'un Double
extension Double {
    func formatedPrice() -> String {
        guard self == .zero else {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.minimumFractionDigits = 2
            formatter.maximumFractionDigits = 2
            formatter.locale = Locale(identifier: "fr_FR")
            return formatter.string(from: NSNumber(value: self))! + "€"
        }
        return "Nous consulter." // return spécifique lorsque le Double vaut zéro
    }
}

#Preview {
    DishRow(dish: mainCourses.0.first!)
}
