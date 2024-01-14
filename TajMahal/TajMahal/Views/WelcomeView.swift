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
        ZStack {
            // fond blanc intégral à l'app
            ContainerRelativeShape()
                .fill(.white)
                .ignoresSafeArea()
            NavigationStack {
                Image("TajMahal")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
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
                .padding([.top, .bottom]
                )
                InformationView()
                Spacer()
                NavigationLink {
                    MenuView()
                } label : {
                    MenuButton()
                        .padding(.top)
                }
            }
            .padding()
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

struct InformationView: View {
    var body: some View {
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

struct MenuButton: View {
    var body: some View {
        Button(action: {
            // affiche le menu
        }) {
            // texte et aspect du bouton
            Text("Accéder au menu")
                .foregroundColor(.white)
                .bold()
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color("CustomRed"))
                .cornerRadius(10)
        }
    }
}

#Preview {
    WelcomeView()
}
