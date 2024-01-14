//
//  LaunchScreenView.swift
//  TajMahal
//
//  Created by Greg on 14/01/2024.
//

import SwiftUI

// page au lancement de l'app
struct LaunchScreenView: View {
    var body: some View {
        ZStack {
            // installe un fond rouge à la vue ; conforme à la référence fournie dans les assets
            ContainerRelativeShape()
                .fill(Color("CustomRed"))
                .ignoresSafeArea()
            // affichage du logo centré à l'écran avec une taille de 150x150
            Image("Logo")
                .resizable()
                .frame(width: 150, height: 150)
        }
    }
}

#Preview {
    LaunchScreenView()
}
