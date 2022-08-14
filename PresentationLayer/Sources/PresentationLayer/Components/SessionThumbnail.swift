//
//  SessionThumbnail.swift
//
//
//  Created by Lukáš Růžička on 03.08.2022.
//

import DomainLayer
import SwiftUI

struct SessionThumbnail: View {

    let sessionDetail: SessionDetail
    var showSessionName = true
    private var weather: [Weather] { sessionDetail.forecast?.map(\.weather) ?? [] }

    var body: some View {
        VStack(spacing: 16) {
            HStack {
                if showSessionName {
                    Text(sessionDetail.name)
                        .font(.headline)
                    Spacer()
                }
                ForEach(weather, id: \.self) {
                    $0.icon
                        .font(showSessionName ? .body : .title)
                }
            }
            ForEach(weather, id: \.self) { weather in
                HStack {
                    VStack(alignment: .leading) {
                        Text("Temp: " + weather.temperature.formatted())
                        if let humidity = weather.humidity {
                            Text("Humid: \((humidity * 100).formatted())%")
                        }
                        if let cloudCover = weather.cloudCover {
                            Text("Cloud: \((cloudCover * 100).formatted())%")
                        }
                    }
                    .font(.footnote)
                    Spacer()
                    WindView(wind: weather.wind)
                    Spacer()
                    RainView(rain: weather.rain)
                }
                if weather != self.weather.last {
                    Divider()
                        .blur(radius: 1)
                }
            }
        }
    }
}

struct SessionThumbnail_Previews: PreviewProvider {

    @ViewBuilder
    static var previews: some View {
        VStack(spacing: 24) {
            SessionThumbnail(sessionDetail: .mockFP1)
            SessionThumbnail(sessionDetail: .mockQualifying)
            SessionThumbnail(sessionDetail: .mockRace)
        }
    }
}
