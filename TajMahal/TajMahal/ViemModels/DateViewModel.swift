//
//  DateViewModel.swift
//  TajMahal
//
//  Created by Greg on 30/01/2024.
//

import Foundation

// cette enumération répertorie les jours de la semaine
enum WeekDayName: String, Hashable, Codable {
    case monday,
         tuesday,
         wednesday,
         thursday,
         friday,
         saturday,
         sunday
    
    // méthode qui renvoie le jour de la semaine en Français
    func inFrench() -> String {
        switch self {
        case .monday:
            return "lundi"
        case .tuesday:
            return "mardi"
        case .wednesday:
            return "mercredi"
        case .thursday:
            return "jeudi"
        case .friday:
            return "vendredi"
        case .saturday:
            return "samedi"
        case .sunday:
            return "dimanche"
        }
    }
}

struct DateViewModel {
    
    // méthode qui renvoie le cas d'enum correspondant au jour actuel à Paris
    func getTodayWeekDayName() -> WeekDayName {
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        dateFormatter.locale = Locale(identifier: "us_US")
        dateFormatter.timeZone = TimeZone(identifier: "Europe/Paris")
        let weekDayName = dateFormatter.string(from: date).lowercased()
        
        return WeekDayName(rawValue: weekDayName) ?? .monday
    }
}
