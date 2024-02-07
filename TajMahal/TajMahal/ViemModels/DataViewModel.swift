//
//  DataViewModel.swift
//  TajMahal
//
//  Created by Greg on 14/01/2024.
//

import SwiftUI

final class DataViewModel: ObservableObject {
    // MARK: - PROPERTIES
            
    // on utilise @Published pour "observer" les changements apportées aux données chargées
    @Published var officeInformations: OfficeInformation = OfficeInformation(name: "", type: "", serviceType: "", address: Address(firstLine: "", postalCode: 0, city: ""), phoneNumber: "", openingHours: [OpeningHour(day: .monday, hours: "")], webSiteURL: "")
    
    @Published var dishes: [(data:[Dish], title:String)] = [(data:[], title:"")]

    // MARK: - METHODS
    
    func loadJsonFiles() {
        self.officeInformations = load("officeInformationsData")
        self.dishes = [(data: load("appetizersData"), title: "Entrées"), (data: load("mainCoursesData"), title: "Plats Principaux")]
    }

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
    } //: func load
}
