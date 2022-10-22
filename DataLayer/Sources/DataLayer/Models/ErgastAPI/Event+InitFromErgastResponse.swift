//
//  Event+InitFromErgastResponse.swift
//  
//
//  Created by Lukas Ruzicka on 22.10.2022.
//

import DomainLayer
import Foundation
import Utils

extension Event {

    init?(from responseModel: ErgastEventResponseModel.MRData.RaceTable.Race, serie: Serie) {
        guard let latitude = Double(responseModel.Circuit.Location.lat),
              let longitude = Double(responseModel.Circuit.Location.long) else { return nil }
        let id = serie.rawValue + "_" + responseModel.season + "_" + responseModel.round
        let sessions: [Session] = [
            .init(from: responseModel.FirstPractice, type: .practice(number: 1), eventId: id),
            .init(from: responseModel.SecondPractice, type: .practice(number: 2), eventId: id),
            .init(from: responseModel.ThirdPractice, type: .practice(number: 3), eventId: id),
            .init(from: responseModel.Qualifying, type: .qualifying(), eventId: id),
            .init(from: responseModel.Sprint, type: .sprint, eventId: id),
            .init(from: responseModel, eventId: id),
        ]
            .compactMap { $0 }
            .sorted { $0.dateRange.lowerBound < $1.dateRange.lowerBound }

        self.init(
            serie: serie,
            id: id,
            name: responseModel.raceName.replacingOccurrences(of: "Grand Prix", with: "GP"),
            countryCode: responseModel.Circuit.Location.country.countryCodeFromCountryName,
            trackName: responseModel.Circuit.circuitName,
            trackMapUrl: responseModel.trackMapUrl,
            location: .init(latitude: latitude, longitude: longitude),
            sessions: sessions
        )
    }
}

// MARK: - Country code
private extension String {

    var countryCodeFromCountryName: String? {
        for code in NSLocale.isoCountryCodes {
            let locale = NSLocale(localeIdentifier: "en")
            let countryName = locale
                .displayName(forKey: NSLocale.Key.countryCode, value: code)?
                .sanitizedCountryName ?? ""
            if countryName.lowercased().contains(self.lowercased()) {
                return code
            }
        }
        NonFatalHandler.log(.missingValue(valueType: "countryCode",
                                          key: self,
                                          domain: "ErgastAPI"))
        return nil
    }

    /// To conform to Ergast API responses
    private var sanitizedCountryName: String {
        switch self {
        case "United States":
            return "USA"
        case "United Arab Emirates":
            return "UAE"
        default:
            return self
        }
    }
}

// MARK: - Track map URL
private extension ErgastEventResponseModel.MRData.RaceTable.Race {

    var trackMapUrl: URL? {
        var mapName = self.Circuit.Location.country
        switch self.Circuit.circuitName {
        case "Autodromo Enzo e Dino Ferrari":
            mapName = "Emilia Romagna"
        case "Miami International Autodrome":
            mapName = "Miami"
        case "Silverstone Circuit":
            mapName = "Great Britain"
        case "Circuit of the Americas":
            mapName = "United States"
        case "Yas Marina Circuit":
            mapName = "Abu Dhabi"
        default:
            break
        }
        mapName = mapName.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? mapName
        return URL(string: "https://www.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/\(mapName).png")
    }
}

// MARK: - Array init
extension Array where Element == Event {

    init(from responseModel: ErgastEventResponseModel, serie: Serie) {
        let races = responseModel.MRData.RaceTable.Races
        self = races.compactMap {
            Event(from: $0, serie: serie)
        }
    }
}
