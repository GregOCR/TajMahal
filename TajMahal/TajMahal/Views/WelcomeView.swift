//
//  WelcomeView.swift
//  TajMahal
//
//  Created by Amandine Cousin on 31/10/2023.
//

import SwiftUI

// Page d'accueil
struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            RestaurantImage() // affiche l'image de présentation du restaurant
            RestaurantIdentity() // affiche le type et le nom du restaurant + le logo
                .padding(.top)
            RestaurantInformationsView() // affiche les informations relatives au restaurant
                .padding([.top, .bottom])
            NavigationLink {
                MenuView()
            } label : {
                MenuButtonView() // affiche le bouton permettant d'accéder au menu
            }
        }
        .padding() // espace tournant pour l'ensemble des éléments
    }
}

struct RestaurantImage: View {
    var body: some View {
        Image("TajMahal")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct RestaurantIdentity: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Restaurant Indien")
                    .font(.subheadline)
                    .foregroundStyle(Color.gray)
                Text("Taj Mahal")
                    .font(.title)
                    .foregroundStyle(Color(UIColor.darkGray))
            }
            Spacer()
            Image("Logo")
                .resizable()
                .frame(width: 50, height: 50)
                .colorInvert().opacity(0.5)
        }
    }
}

struct InformationLine: View {
    
    var imageName: String
    var firstInformation: String
    var secondInformation: String
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .padding(.trailing, 5)
            Text(firstInformation)
            Spacer()
            Text(secondInformation)
        }
        .opacity(0.5)
        .font(.system(size: 16))
    }
}

struct RestaurantInformationsView: View {
    var body: some View {
        VStack {
            InformationLine(imageName: "clock",
                            firstInformation: "Mardi",
                            secondInformation: "11h30 - 14h30 • 18h30 - 22h00")
            InformationLine(imageName: "takeoutbag.and.cup.and.straw",
                            firstInformation: "Type de service",
                            secondInformation: "À emporter")
            InformationLine(imageName: "map",
                            firstInformation: "12 Avenue de la Brique - 75010 PARIS",
                            secondInformation: "")
            InformationLine(imageName: "network",
                            firstInformation: "www.tajmahal.fr",
                            secondInformation: "")
            InformationLine(imageName: "iphone.gen1",
                            firstInformation: "06 12 34 56 78",
                            secondInformation: "")
        }
    }
}

struct MenuButtonView: View {
    var body: some View {
        Text("Accéder au menu")
            .foregroundColor(.white)
            .bold()
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color("CustomRed"))
            .cornerRadius(10)
    }
}

#Preview {
    WelcomeView()
}
