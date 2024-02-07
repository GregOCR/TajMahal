//
//  DishList.swift
//  TajMahal
//
//  Created by Greg on 15/01/2024.
//

import SwiftUI

// structure qui affiche la liste des repas
struct DishList: View {
    
    @StateObject var dataVM = DataViewModel() // source de données
    
    var body: some View {
        NavigationView {
            List(dataVM.dishes, id:\.title) { section in // récupération des données dans une liste en tant que section
                SectionView(section: section)
            }
            .listRowSpacing(20) // espace entre chaque encart de plats présentés dans la liste
        }
        .navigationTitle("") // évite le mot "Back" sur le chevron de retour à la page précédente
        .onAppear(perform: {
            dataVM.loadJsonFiles() // charge les données lors du chargement de la page
        })
    }
}

struct SectionView: View {
    
    var section: (data: [Dish], title: String)
    
    var body: some View {
        Section(header: Text(section.title) // titre de la section (entrées / plats principaux)
            .font(.custom(AppFont.plusJakartaSans_700.getFontName(), size: 16))
            .foregroundStyle(AppColor.customMiddleContrast.asColor())
        ){
            ForEach(section.data) { dish in
                DishLinkView(dish: dish)
            }
        }
        .textCase(nil) // permet d'afficher le header de chaque section de liste dans sa casse de texte originale
    }
}

struct DishLinkView: View {
    
    var dish: Dish
    
    var body: some View {
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
                }
            )
            { }
                .buttonStyle(PlainButtonStyle())
                .opacity(0) // force l'invisibilité du chevron droit
        }
    }
}

#Preview {
    DishList()
}
