//
//  Dish.swift
//  TajMahal
//
//  Created by Amandine Cousin on 31/10/2023.
//  Modified by Greg on 14/01/2024.
//

// Cette enumération répertorie 3 niveaux de piment
enum SpiceLevel: String, Hashable, Codable {
    case light,
         medium,
         hot
}

// Représente l'objet "plat", qui figure sur la carte du menu
struct Dish: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var description: String
    var allergens: String
    var ingredients: String
    var spiceLevel: SpiceLevel
    var imageName: String
    var price: Double
}
