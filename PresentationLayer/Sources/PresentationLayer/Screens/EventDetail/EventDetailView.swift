//
//  EventDetailView.swift
//  
//
//  Created by Lukas Ruzicka on 13.08.2022.
//

import DomainLayer
import SwiftUI
import Utils

public struct EventDetailView: View {

    // MARK: - Properties
    @ObservedObject var viewModel: EventDetailViewModel

    // MARK: - Body
    public var body: some View {
        List {
            Section {
                EmptyView()
            } header: {
                header(for: viewModel.eventWithForecast.event)
            }
            .textCase(.none)
            .font(.headline)
            Section(L10n.sessionsString) {
                ForEach(viewModel.eventWithForecast.event.sessions, id: \.self) {
                    sessionRow($0)
                }
            }
        }
        .animation(.default, value: viewModel.eventWithForecast)
        .foregroundColor(.Text.primary)
        .navigationTitle(viewModel.eventWithForecast.event.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if viewModel.isLoading {
                ProgressView()
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
        .handleError($viewModel.error)
    }
}

// MARK: - Subviews
private extension EventDetailView {

    func header(for event: Event) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 12) {
                Text(viewModel.eventDateRangeFormatted)
                HStack {
                    event.flagImage
                    Text(event.trackName)
                }
            }
            Spacer(minLength: 16)
            event.trackMapImage()
        }
        .frame(height: 96)
    }

    @ViewBuilder
    func weatherIcon(for session: Session) -> some View {
        if let sessionForecast = viewModel.eventWithForecast.sessionDetails?.first(where: { $0.id == session.id })?.forecast {
            ForEach(sessionForecast, id: \.self) {
                $0.icon
            }
        } else if let dailyForecast = viewModel.eventWithForecast.dailyForecast,
                    let sessionDayForecast = dailyForecast.first(where: { Calendar.current.isDate($0.date, inSameDayAs: session.dateRange.lowerBound) }) {
            sessionDayForecast.icon
            
        }
    }

    func sessionRow(_ session: Session) -> some View {
        NavigationLink(value: NavigationDestination.sessionDetail(sessionDetail: viewModel.getSessionDetail(for: session))) {
            HStack {
                session.type.name
                Spacer()
                if session.isLive {
                    LiveLabel()
                        .padding(.trailing, 16)
                }
                if session.isFinished {
                    SFSymbol.chequeredFlag
                        .foregroundColor(.Text.secondary)
                        .opacity(0.5)
                } else {
                    weatherIcon(for: session)
                }
            }
            .padding(.vertical, 4)
        }
    }
}

// MARK: - Preview
struct EventDetailView_Previews: PreviewProvider {

    static var previews: some View {
        EventDetailView(viewModel: .init(event: .mockFormula1BelgianGP))
            .previewDisplayName("F1 Belgian GP")
        EventDetailView(viewModel: .init(event: .mockMotoGPCzechGP))
            .previewDisplayName("MotoGP Czech GP")
    }
}
