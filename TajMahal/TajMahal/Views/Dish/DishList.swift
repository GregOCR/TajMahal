//
//  DishList.swift
//  TajMahal
//
//  Created by Greg on 15/01/2024.
//

import SwiftUI

// structure qui affiche la liste des repas
struct DishList: View {
    
    var body: some View {
        
        let dishesSections: [(data: [Dish], title: String)] = [appetizers, mainCourses] // contient les données chargées depuis la base concernant les entrées et les plats principaux
        
        List(dishesSections, id:\.title) { section in // récupération des données dans une liste en tant que section
            Section(header: Text(section.title) // titre de la section (entrées / plats principaux)
                .font(.custom(AppFont.plusJakartaSans_700.getFontName(), size: 16))
                .foregroundStyle(AppColor.customMiddleContrast.asColor())
            ){
                ForEach(section.data) { dish in // pour chaque paquet de données de plats
                    ZStack {
                        DishRow(dish: dish) // affiche la cellule de présentation d'un plat
                            .padding([.top, .bottom], 4)
                            .padding([.leading, .trailing], -5)
                        NavigationLink(destination: DishDetailsView(dish: dish) // vue détails du plat chargée avec l'objet du plat en paramètre
                            .toolbar {
                                ToolbarItem(placement: .topBarLeading) {
                                    Text(dish.name) // lorsque les détails sont chargés, affiche le nom du plat dans la toolbar
                                        .font(.custom(AppFont.plusJakartaSans_700.getFontName(), size: 20)) // typo personnalisée pour la navBar
                                        .foregroundStyle(AppColor.customHighContrast.asColor()) // couleur personnalisée pour le titre de la navBar
                                }
                            })
                        { }
                            .buttonStyle(PlainButtonStyle())
                            .opacity(0) // force l'invisibilité du chevron droit
                    }
                }
            }
            .textCase(nil) // permet d'afficher le header de chaque section de liste dans sa casse de texte originale
        }
        .navigationTitle("") // évite le mot "Back" sur le chevron de retour à la page précédente
        .listRowSpacing(20) // espace entre chaque encart de plats présentés dans la liste
    }
}

#Preview {
    DishList()
}
