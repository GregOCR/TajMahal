//
//  ModelData.swift
//  TajMahal
//
//  Created by Greg on 14/01/2024.
//

import Foundation

// récolte les data JSON relatives aux informations générales du restaurant
var officeInformations: OfficeInformation = load("officeInformationsData")

// récolte les data JSON relatives aux informations des entrées
var appetizers: (data:[Dish], title:String) = (data:load("appetizersData"),
                                               title:"Entrées")

// récolte les data JSON relatives aux informations des plats principaux
var mainCourses: (data:[Dish], title:String) = (data:load("mainCoursesData"),
                                                title:"Plats Principaux")

func load<T: Decodable>(_ filename: String) -> T {
    
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: "json")
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
