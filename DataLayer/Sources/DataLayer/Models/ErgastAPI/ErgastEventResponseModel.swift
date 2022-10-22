//
//  ErgastEventResponseModel.swift
//  
//
//  Created by Lukas Ruzicka on 22.10.2022.
//

struct ErgastEventResponseModel: Decodable {

    let MRData: MRData

    struct MRData: Decodable {

        let RaceTable: RaceTable

        struct RaceTable: Decodable {

            let Races: [Race]

            struct Race: Decodable {

                let season: String
                let round: String
                let raceName: String
                let Circuit: Circuit
                let date: String
                let time: String
                let FirstPractice: Session?
                let SecondPractice: Session?
                let ThirdPractice: Session?
                let Qualifying: Session?
                let Sprint: Session?

                struct Circuit: Decodable {

                    let circuitName: String
                    let Location: Location

                    struct Location: Decodable {

                        let lat: String
                        let long: String
                        let country: String
                    }
                }

                struct Session: Decodable {

                    let date: String
                    let time: String
                }
            }
        }
    }
}
