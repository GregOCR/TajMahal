//
//  OfficeInformation.swift
//  TajMahal
//
//  Created by Greg on 23/01/2024.
//

// représente les informations du restaurant
struct OfficeInformation: Hashable, Codable {
    var name: String
    var type: String
    var serviceType: String
    var address: Address
    var phoneNumber: String
    var openingHours: [OpeningHour]
    var webSiteURL: String
}

// représente les informations qui définissent une adresse
struct Address: Hashable, Codable {
    var firstLine: String
    var postalCode: Int
    var city: String
}

// représente les informations qui définissent des heures ouvertures
struct OpeningHour: Hashable, Codable {
    var day: WeekDayName
    var hours: String
}
