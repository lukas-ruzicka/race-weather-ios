//
//  EventDetailView.swift
//  
//
//  Created by Lukáš Růžička on 13.08.2022.
//

import DomainLayer
import SwiftUI
import Utils

public struct EventDetailView: View {

    @ObservedObject var viewModel: EventDetailViewModel

    public var body: some View {
        List {
            Section {
                Text(viewModel.eventWithForecast.event.start.formatted(.dateTime.day().month())
                     + " - "
                     + viewModel.eventWithForecast.event.end.formatted(.dateTime.day().month()))
            }
            Section("Sessions") {
                ForEach(viewModel.eventWithForecast.event.sessions, id: \.self) { session in
                    NavigationLink {
                        Resolver.resolve(SessionDetailView.self, args: viewModel.getSessionDetail(for: session))
                    } label: {
                        HStack {
                            Text(session.name)
                            if session.isFinished {
                                SFSymbol.chequeredFlag
                                    .foregroundColor(.gray)
                                Spacer()
                            } else {
                                Spacer()
                                weatherIcon(for: session)
                            }
                        }
                        .padding(.vertical, 4)
                    }

                }
            }
        }
        .navigationTitle(viewModel.eventWithForecast.event.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Subviews
private extension EventDetailView {

    @ViewBuilder
    func weatherIcon(for session: Session) -> some View {
        if let sessionForecast = viewModel.eventWithForecast.sessionDetails?.first(where: { $0.id == session.id })?.forecast {
            ForEach(sessionForecast.map(\.weather), id: \.self) {
                $0.icon
            }
        } else if let dailyForecast = viewModel.eventWithForecast.dailyForecast,
                    let sessionDayForecast = dailyForecast.first(where: { Calendar.current.isDate($0.date, inSameDayAs: session.dateRange.lowerBound) }) {
            sessionDayForecast.weather.icon
            
        }
    }
}

struct EventDetailView_Previews: PreviewProvider {

    static var previews: some View {
        EventDetailView(viewModel: .init(eventWithForecast: .mockDetailed))
            .previewDisplayName("Detailed")
        EventDetailView(viewModel: .init(eventWithForecast: .mockDaily))
            .previewDisplayName("Daily forecast")
        EventDetailView(viewModel: .init(eventWithForecast: .mockNoForecast))
            .previewDisplayName("No forecast")
    }
}
