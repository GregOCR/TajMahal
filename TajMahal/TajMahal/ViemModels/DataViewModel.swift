//
//  ModelData.swift
//  TajMahal
//
//  Created by Greg on 14/01/2024.
//

import SwiftUI

final class DataViewModel: ObservableObject {
    
    // MARK: - PROPERTIES
        
    // on utilise @Published pour "observer" les changements apportées aux données chargées
    @Published var officeInformations: [OfficeInformation] = []
    @Published var appetizers: (data:[Dish], title:String) = (data: [], title: "")
    @Published var mainCourses: (data:[Dish], title:String) = (data: [], title: "")
    
    // MARK: - INITIALIZATION
    
    init() { // chargement des données
        self.officeInformations = load("officeInformationsData")
        self.appetizers = (data: load("appetizersData"), title: "Entrées")
        self.mainCourses = (data: load("mainCoursesData"), title: "Plats Principaux")
    }

    // MARK: - METHODS

    // permet de charger et de décoder les données JSON pour en retourner un Objet
    private func load<T: Decodable>(_ filename: String) -> T {
        
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
    } //: FUNC load
}
