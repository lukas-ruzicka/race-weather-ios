//
//  SeriesRepository.swift
//  
//
//  Created by Lukáš Růžička on 30.07.2022.
//

public protocol SeriesRepository {

    func getAll() -> [Serie]
    func getAvailable() -> [Serie]
    func setAvailable(_ series: [Serie])
}
