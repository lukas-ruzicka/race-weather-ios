//
//  SessionDetailView.swift
//  
//
//  Created by Lukáš Růžička on 13.08.2022.
//

import SwiftUI

public struct SessionDetailView: View {

    @ObservedObject var viewModel: SessionDetailViewModel

    public var body: some View {
        VStack(spacing: 24) {
            timingInfo
            weatherInfo
            Spacer()
        }
        .padding()
        .navigationTitle(viewModel.session.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Subviews
private extension SessionDetailView {

    @ViewBuilder
    var timingInfo: some View {
        if viewModel.session.start > Date() {
            Text("Starts in **\(viewModel.session.start, style: .timer)**")
        } else if viewModel.session.end > Date() {
            Text("Ends in **\(viewModel.session.end, style: .timer)**")
        } else {
            Text("Session already ended")
        }
    }

    @ViewBuilder
    var weatherInfo: some View {
        if let weather = viewModel.session.weather {
            VStack(spacing: 4) {
                weather.type.icon
                Text("\(weather.temperature.formatted())°")
                Text("\(weather.chanceOfRain.formatted())%")
            }
        } else {
            Text("No weather yet 🤷🏽‍♂️")
        }
    }
}

struct SessionDetailView_Previews: PreviewProvider {

    static var previews: some View {
        SessionDetailView(viewModel: .init(session: .mockFP1))
            .previewDisplayName("Practice")
        SessionDetailView(viewModel: .init(session: .mockQualifying))
            .previewDisplayName("Qualifying")
        SessionDetailView(viewModel: .init(session: .mockRace))
            .previewDisplayName("Race")
    }
}
