//
//  EventOverview.swift
//  
//
//  Created by Lukáš Růžička on 03.08.2022.
//

import DomainLayer
import SwiftUI

struct EventOverview: View {

    let eventWithForecast: EventWithForecast

    var body: some View {
        VStack(spacing: 16) {
            HStack(alignment: .top) {
                if let date = eventWithForecast.event.mainDate {
                    Text(date.formatted(date: .abbreviated, time: .omitted))
                }
                Spacer()
                Text(eventWithForecast.event.name)
                    .font(.title2)
                Spacer()
                eventWithForecast.event.serie.icon
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 48, height: 24)
            }
            Divider()
            if let sessionDetails = eventWithForecast.sessionDetails {
                sessionDetailsOverview(sessionDetails)
            } else if let dailyForecast = eventWithForecast.dailyForecast {
                daysOverview(dailyForecast)
            } else {
                Text("No forecast yet")
                    .font(.footnote)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Subviews
private extension EventOverview {

    @ViewBuilder
    func sessionDetailsOverview(_ sessionDetails: [SessionDetail]) -> some View {
        ForEach(sessionDetails.filter { !$0.isFinished }, id: \.self) {
            SessionThumbnail(sessionDetail: $0)
                .padding(.vertical, 4)
        }
    }

    @ViewBuilder
    func daysOverview(_ dailyForecast: [Forecast]) -> some View {
        HStack(alignment: .top) {
            Spacer()
            ForEach(dailyForecast, id: \.self) { forecast in
                VStack(spacing: 4) {
                    Text(forecast.date.formatted(.dateTime.day().month()))
                        .font(.headline)
                    forecast.weather.icon
                        .padding()
                    ForEach(getSessions(in: forecast.date), id: \.self) {
                        Text($0.name)
                            .font(.footnote)
                    }
                }
                Spacer()
            }
        }
    }
}

// MARK: - Supporting functions
private extension EventOverview {

    func getSessions(in day: Date) -> [Session] {
        eventWithForecast.event.sessions.filter {
            Calendar.current.isDate($0.dateRange.lowerBound, inSameDayAs: day)
        }
    }
}

struct EventOverview_Previews: PreviewProvider {

    static var previews: some View {
        EventOverview(eventWithForecast: .mockDetailed)
            .padding()
            .previewDisplayName("Detailed")
        EventOverview(eventWithForecast: .mockDaily)
            .padding()
            .previewDisplayName("Daily forecast")
        EventOverview(eventWithForecast: .mockNoForecast)
            .padding()
            .previewDisplayName("No forecast")
    }
}
