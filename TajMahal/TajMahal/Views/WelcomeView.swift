//
//  WelcomeView.swift
//  TajMahal
//
//  Created by Amandine Cousin on 31/10/2023.
//  Modified by Greg on 14/01/2024.
//

import SwiftUI

private let officeInformation = officeInformations

// Page d'accueil
struct WelcomeView: View {
    
    var body: some View {
        
        let viewPadding: CGFloat = 25 // espace par défaut de la page
        
        NavigationStack {
            VStack {
                MainImageView() // affiche l'image principale de présentation du restaurant
                RestaurantIdentityView() // affiche le type + le nom du restaurant + le logo
                    .padding(.top, viewPadding) // rajoute un espace au dessus de la vue
                RestaurantInformationsView() // affiche les informations relatives au restaurant
                    .padding(.top, viewPadding) // rajoute un espace au dessus de la vue
                NavigationLink {
                    DishList() // liste des repas chargés lorsque MenuButtonView() est appuyé
                        .toolbar {
                            ToolbarItem(placement: .principal) {
                                Text("Menu")
                                    .font(.custom(AppFont.plusJakartaSans_700.getFontName(),
                                                  size: 20)) // typo personnalisée pour la navBar
                                    .foregroundStyle(AppColor.customHighContrast.asColor())// couleur personnalisée pour le titre de la navBar
                            }
                        }
                } label : {
                    MenuButtonView() // affiche le bouton permettant d'accéder à la view du menu
                        .padding(.top, viewPadding) // rajoute un espace au dessus du button
                }
                .navigationTitle("") // remplace le mot "Back" du chevron de retour de la page suivante
            }
            .padding(20) // rajoute un espace tournant à l'ensemble des éléments de la page
        }
    }
}

struct MainImageView: View {
    var body: some View {
        Image("TajMahal")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(minHeight: .zero)
            .cornerRadius(10)
    }
}

struct RestaurantIdentityView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(officeInformation.type)
                    .foregroundStyle(AppColor.customMiddleContrast.asColor())
                    .font(.custom(AppFont.plusJakartaSans_400.getFontName(),
                                  size: 15))
                Text(officeInformation.name)
                    .foregroundStyle(AppColor.customHighContrast.asColor())
                    .font(.custom(AppFont.plusJakartaSans_700.getFontName(),
                                  size: 22))
            }
            Spacer()
            Image("Logo")
                .resizable()
                .frame(width: 40)
                .foregroundStyle(AppColor.customLightContrast.asColor())
        }
        .frame(height: 40)
    }
}

struct InformationLineView: View {
    
    var imageName: String
    var leftInformation: String
    var rightInformation: String
    
    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.trailing, 10)
                .foregroundStyle(AppColor.customMiddleContrast.asColor())
                .frame(width: 25,
                       height: 15)
            Text(leftInformation)
            Spacer()
            Text(rightInformation)
        }
        .foregroundStyle(AppColor.customMiddleContrast.asColor())
        .font(.custom(AppFont.plusJakartaSans_600.getFontName(),
                      size: 14))
    }
}

struct RestaurantInformationsView: View {
    
    var body: some View {
    
        let dateModel = DateModel()
        
        let officeOpeningHoursInfos = officeInformation.openingHours.first(where: {
            $0.day == dateModel.getTodayWeekDayName()
        })
        
        VStack {
            // informations des horaires d'ouverture
            InformationLineView(imageName: "clock",
                                leftInformation: officeOpeningHoursInfos?.day.inFrench().capitalized ?? "",
                                rightInformation: officeOpeningHoursInfos?.hours ?? "")
            Spacer()
            // informations sur le type de service du restaurant
            InformationLineView(imageName: "bag",
                                leftInformation: "Type de service",
                                rightInformation: officeInformation.serviceType)
            Spacer()
            // adresse du restaurant
            InformationLineView(imageName: "pinPoint",
                                leftInformation: "\(officeInformation.address.firstLine) - \(officeInformation.address.postalCode) \(officeInformation.address.city)",
                                rightInformation: "")
            Spacer()
            // site internet du restaurant
            InformationLineView(imageName: "map",
                                leftInformation: officeInformation.webSiteURL,
                                rightInformation: "")
            Spacer()
            // téléphone du restaurant
            InformationLineView(imageName: "phone",
                                leftInformation: officeInformation.phoneNumber,
                                rightInformation: "")
        }
        .frame(height: 130) // taille en hauteur de la zone des informations du restaurant
    }
}

struct MenuButtonView: View {
    var body: some View {
        Text("Accéder au menu")
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .font(.custom(AppFont.plusJakartaSans_700.getFontName(),
                          size: 18))
            .background(AppColor.customRed.asColor())
            .cornerRadius(10)
    }
}

#Preview {
    WelcomeView()
}
