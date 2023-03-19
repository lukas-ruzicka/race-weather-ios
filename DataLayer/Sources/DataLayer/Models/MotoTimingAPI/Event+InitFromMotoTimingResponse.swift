//
//  Event+InitFromMotoTimingResponse.swift
//  
//
//  Created by Lukas Ruzicka on 28.10.2022.
//

import CoreLocation
import DomainLayer
import Foundation
import Utils

extension Event {

    init?(from responseModel: MotoTimingEventResponseModel, serie: Serie) {
        guard let location = responseModel.location,
              let startDate = Date(string: responseModel.start_date),
              let season = Calendar.current.dateComponents([.year], from: startDate).year else { return nil }

        let id = serie.rawValue + "_\(season)_" + responseModel.name.replacingOccurrences(of: " ", with: "_")
        let sessions = responseModel.sessions_grouped_by_date.utc
            .reduce(Array<MotoTimingEventResponseModel.SessionsGroupedByDate.SessionGroup.Session>()) { return $0 + $1.sessions }
            .filter { $0._class.lowercased() == serie.rawValue.lowercased() }
            .map {
                Session(from: $0, eventId: id)
            }
            .compactMap { $0 }
            .sorted { $0.dateRange.lowerBound < $1.dateRange.lowerBound }
        guard !sessions.isEmpty else { return nil }

        self.init(
            serie: serie,
            id: id,
            name: responseModel.name
                .replacingOccurrences(of: "Grand Prix", with: "GP")
                .replacingOccurrences(of: "Gran Premio", with: "GP")
                .replacingOccurrences(of: "Grande Prémio", with: "GP")
                .replacingOccurrences(of: "Gran Premi", with: "GP"),
            countryCode: responseModel.country_code,
            trackName: responseModel.circuit,
            trackMapUrl: responseModel.trackMapUrl,
            location: location,
            sessions: sessions
        )
    }
}

// MARK: - Circuit location
private extension MotoTimingEventResponseModel {

    var location: CLLocation? {
        switch circuit {
        case "Lusail International Circuit":
            return .init(latitude: 25.486882818831937, longitude: 51.454617241245920)
        case "Pertamina Mandalika Circuit":
            return .init(latitude: -8.898168485480369, longitude: 116.30567307376458)
        case "Termas de Río Hondo":
            return .init(latitude: -27.511037525192204, longitude: -64.9212256072422)
        case "Circuit Of The Americas":
            return .init(latitude: 30.135065891271196, longitude: -97.63512647667149)
        case "Autódromo Internacional do Algarve":
            return .init(latitude: 37.23175197787033, longitude: -8.62696702864022)
        case "Circuito de Jerez - Ángel Nieto":
            return .init(latitude: 36.70984020768218, longitude: -6.031747572593253)
        case "Le Mans":
            return .init(latitude: 47.956593584172644, longitude: 0.20939580207602582)
        case "Autodromo Internazionale del Mugello":
            return .init(latitude: 43.99681595835054, longitude: 11.37169462005598)
        case "Circuit de Barcelona-Catalunya":
            return .init(latitude: 41.569022677628986, longitude: 2.258245949326792)
        case "Sachsenring":
            return .init(latitude: 50.79206436968035, longitude: 12.688372854501003)
        case "TT Circuit Assen":
            return .init(latitude: 52.95876733307679, longitude: 6.523264689861749)
        case "Silverstone Circuit":
            return .init(latitude: 52.07390869612089, longitude: 1.0134725262105915)
        case "Red Bull Ring - Spielberg":
            return .init(latitude: 47.22378335401158, longitude: 14.76043337871653)
        case "Misano World Circuit Marco Simoncelli":
            return .init(latitude: 43.96229021262511, longitude: 12.686709233107504)
        case "MotorLand Aragón":
            return .init(latitude: 41.08093391595277, longitude: -0.20158873709236166)
        case "Mobility Resort Motegi":
            return .init(latitude: 36.533509345805456, longitude: 140.2275334439742)
        case "Chang International Circuit":
            return .init(latitude: 14.958660096050375, longitude: 103.08556965187582)
        case "Phillip Island":
            return .init(latitude: -38.50094380335379, longitude: 145.23275775881734)
        case "Sepang International Circuit":
            return .init(latitude: 2.7603410090567575, longitude: 101.73281683732247)
        case "Circuit Ricardo Tormo":
            return .init(latitude: 39.48816050658184, longitude: 0.6292142246673847)
        case "Sokol International Racetrack":
            return .init(latitude: 43.584038286041036, longitude: 76.56895699535758)
        case "Buddh International Circuit":
            return .init(latitude: 28.350607264370716, longitude: 77.53538148192355)
        default:
            NonFatalHandler.log(.missingValue(valueType: "location",
                                              key: circuit,
                                              domain: "MotoTimingAPI"))
            return nil
        }
    }
}

// MARK: - Track map URL
private extension MotoTimingEventResponseModel {

    var trackMapUrl: URL? {
        let mapName: String
        switch circuit {
        case "Lusail International Circuit":
            mapName = "1147037330"
        case "Pertamina Mandalika Circuit":
            mapName = "296830177"
        case "Termas de Río Hondo":
            mapName = "1214914475"
        case "Circuit Of The Americas":
            mapName = "1820288300"
        case "Autódromo Internacional do Algarve":
            mapName = "527060692"
        case "Circuito de Jerez - Ángel Nieto":
            mapName = "1199599005"
        case "Le Mans":
            mapName = "1954592764"
        case "Autodromo Internazionale del Mugello":
            mapName = "27120033"
        case "Circuit de Barcelona-Catalunya":
            mapName = "1649678733"
        case "Sachsenring":
            mapName = "1582971518"
        case "TT Circuit Assen":
            mapName = "1082366356"
        case "Silverstone Circuit":
            mapName = "1295476645"
        case "Red Bull Ring - Spielberg":
            mapName = "647582074"
        case "Misano World Circuit Marco Simoncelli":
            mapName = "679204964"
        case "MotorLand Aragón":
            mapName = "1134738928"
        case "Mobility Resort Motegi":
            mapName = "22252200"
        case "Chang International Circuit":
            mapName = "1253788130"
        case "Phillip Island":
            mapName = "1700855440"
        case "Sepang International Circuit":
            mapName = "787801514"
        case "Circuit Ricardo Tormo":
            mapName = "659572185"
        case "Sokol International Racetrack":
            mapName = "1363336181"
        case "Buddh International Circuit":
            mapName = "886244889"
        default:
            NonFatalHandler.log(.missingValue(valueType: "trackMapUrl",
                                              key: circuit,
                                              domain: "MotoTimingAPI"))
            return nil
        }
        return URL(string: "https://www.yamahamotogp.com/showImg/16_circuiti/\(mapName).png")
    }
}
