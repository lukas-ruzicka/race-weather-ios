//
//  SessionDetailView.swift
//  
//
//  Created by Lukáš Růžička on 13.08.2022.
//

import Charts
import SwiftUI

public struct SessionDetailView: View {

    @ObservedObject var viewModel: SessionDetailViewModel

    public var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                timingInfo
                if !viewModel.sessionDetail.isFinished {
                    weatherInfo
                    if !viewModel.rainDetail.isEmpty {
                        chanceChart
                            .transition(.slide)
                        intensityChart
                            .transition(.slide)
                    }
                }
            }
            .padding()
        }
        .animation(.easeOut, value: viewModel.rainDetail)
        .navigationTitle(viewModel.sessionDetail.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if viewModel.isLoading {
                ProgressView()
            }
        }
        .animation(.default, value: viewModel.isLoading)
        .onAppear { viewModel.onAppear() }
    }
}

// MARK: - Subviews
private extension SessionDetailView {

    @ViewBuilder
    var timingInfo: some View {
        if viewModel.sessionDetail.dateRange.lowerBound > Date() {
            Text("Starts in **\(viewModel.sessionDetail.dateRange.lowerBound, style: .timer)**")
        } else if viewModel.sessionDetail.dateRange.upperBound > Date() {
            Text("Ends in **\(viewModel.sessionDetail.dateRange.lowerBound, style: .timer)**")
        } else {
            Text("Session already ended")
        }
    }

    @ViewBuilder
    var weatherInfo: some View {
        if let forecast = viewModel.sessionDetail.forecast, !forecast.isEmpty {
            SessionThumbnail(sessionDetail: viewModel.sessionDetail, showSessionName: false)
                .padding()
        } else {
            Text("No weather yet 🤷🏽‍♂️")
        }
    }

    @ViewBuilder
    var chanceChart: some View {
        VStack(spacing: 4) {
            Text("Chance of rain")
                .font(.headline)
            Chart {
                ForEach(viewModel.rainDetail, id: \.self) {
                    BarMark(
                        x: .value("Time", $0.date),
                        y: .value("Chance", $0.chance)
                    )
                }
            }
            .frame(height: 160)
        }
    }

    @ViewBuilder
    var intensityChart: some View {
        VStack(spacing: 4) {
            Text("Rain intensity")
                .font(.headline)
            Chart {
                ForEach(viewModel.rainDetail, id: \.self) {
                    BarMark(
                        x: .value("Time", $0.date),
                        y: .value("Intensity", $0.intensity.value)
                    )
                }
            }
            .frame(height: 160)
        }
    }
}

struct SessionDetailView_Previews: PreviewProvider {

    static var previews: some View {
        SessionDetailView(viewModel: .init(sessionDetail: .mockFP1))
            .previewDisplayName("Practice")
        SessionDetailView(viewModel: .init(sessionDetail: .mockQualifying))
            .previewDisplayName("Qualifying")
        SessionDetailView(viewModel: .init(sessionDetail: .mockRace))
            .previewDisplayName("Race")
    }
}
