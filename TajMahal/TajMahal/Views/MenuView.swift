//
//  MenuView.swift
//  TajMahal
//
//  Created by Amandine Cousin on 31/10/2023.
//

import SwiftUI

// Menu sous forme de liste
struct MenuView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    let dataModel: DataModel = DataModel()
    
    var body: some View {
        
        List {
            // À completer
        }
        .navigationTitle("Menu")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.left")
            }
        })
    }}

#Preview {
    MenuView()
}
