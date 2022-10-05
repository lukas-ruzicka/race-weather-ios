//
//  EventThumbnail.swift
//
//
//  Created by Lukas Ruzicka on 15.10.2022.
//

import Charts
import DomainLayer
import SwiftUI

struct EventThumbnail: View {

    // MARK: - Properties
    let eventWithForecast: EventWithForecast

    private var sessions: [SessionDetail] { eventWithForecast.sessionDetails?.filter { $0.dateRange.lowerBound > Date() } ?? [] }
    private let dayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EE"
        return formatter
    }()

    // MARK: - Body
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                EventLabel(event: eventWithForecast.event)
                Spacer()
                if let closestSessionStart {
                    CountdownView(date: closestSessionStart)
                        .font(.caption)
                }
            }
            if let forecast = eventWithForecast.dailyForecast {
                dailyForecast(forecast)
            } else if sessions.contains(where: { $0.forecast != nil }) {
                sessionsForecast
            } else {
                L10n.Forecast.notYet
                    .font(.footnote)
                    .padding()
            }
        }
        .foregroundColor(.Text.primary)
        .cardBackground()
    }
}

// MARK: - Subviews
private extension EventThumbnail {

    func dailyForecast(_ dailyForecast: [Forecast]) -> some View {
        HStack(alignment: .top) {
            Spacer()
            ForEach(dailyForecast, id: \.self) { forecast in
                VStack(spacing: 4) {
                    Text(forecast.date.formatted(.dateTime.day().month()))
                        .fontWeight(.semibold)
                    forecast.icon
                        .padding()
                    ForEach(getSessions(in: forecast.date), id: \.self) {
                        $0.type.name
                            .font(.footnote)
                            .foregroundColor(.Text.secondary)
                    }
                }
                Spacer()
            }
        }
        .padding(.vertical, 8)
    }

    var sessionsForecast: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(sessions, id: \.self) {
                    session($0)
                }
            }
            .padding(4)
        }
    }

    @ViewBuilder
    func session(_ session: SessionDetail) -> some View {
        if let forecast = session.forecast {
            VStack(spacing: 8) {
                session.type.name
                    .fontWeight(.semibold)
                Text(forecast.map(\.weather).averageTemperatureFormatted)
                    .font(.footnote)
                Text(forecast.map(\.weather).averageWindSpeedFormatted)
                    .font(.footnote)
                HStack {
                    ForEach(forecast, id: \.self) {
                        $0.icon
                    }
                }
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
        }
    }
}

// MARK: - Supporting functions
private extension EventThumbnail {

    var closestSessionStart: Date? {
        eventWithForecast.event.sessions
            .filter(\.hasntStartedYet)
            .map({ $0.dateRange.lowerBound })
            .min()
    }

    func getSessions(in day: Date) -> [Session] {
        eventWithForecast.event.sessions.filter {
            Calendar.current.isDate($0.dateRange.lowerBound, inSameDayAs: day)
        }
    }
}

// MARK: - Preview
struct EventThumbnail_Previews: PreviewProvider {

    static var previews: some View {
        VStack(spacing: 24) {
            EventThumbnail(eventWithForecast: .mockDetailed)
            EventThumbnail(eventWithForecast: .mockDaily)
        }
        .padding()
    }
}
