//
//  LiveSessionData.swift
//  
//
//  Created by Lukas Ruzicka on 15.10.2022.
//

import DomainLayer

struct LiveSessionData: Hashable {

    let sessionDetail: SessionDetail
    let rainDetail: [RainDetail]
}
