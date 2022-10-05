//
//  SessionDetailView.swift
//  
//
//  Created by Lukas Ruzicka on 13.08.2022.
//

import Charts
import DomainLayer
import SwiftUI

public struct SessionDetailView: View {

    // MARK: - Properties
    @ObservedObject var viewModel: SessionDetailViewModel

    // MARK: - Body
    public var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                if viewModel.sessionDetail.isFinished {
                    L10n.SessionDetail.finished
                } else {
                    sessionContent
                }
            }
            .padding(16)
        }
        .frame(maxWidth: .infinity)
        .animation(.easeOut, value: viewModel.rainDetail)
        .foregroundColor(.Text.primary)
        .background(Color.Background.primary)
        .navigationTitle(viewModel.sessionDetail.type.name)
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
private extension SessionDetailView {

    @ViewBuilder
    var sessionContent: some View {
        HStack {
            ForEach(viewModel.sessionDetail.forecast ?? [], id: \.self) {
                $0.icon
                    .font(.title2)
            }
            Spacer()
            timingInfo
        }
        weatherInfo
        if !viewModel.rainDetail.isEmpty {
            chanceChart
                .transition(.slide)
            intensityChart
                .transition(.slide)
        }
    }

    @ViewBuilder
    var timingInfo: some View {
        if viewModel.sessionDetail.dateRange.lowerBound > Date() {
            HStack(spacing: 4) {
                L10n.starts
                CountdownView(date: viewModel.sessionDetail.dateRange.lowerBound)
            }
        } else if viewModel.sessionDetail.dateRange.upperBound > Date() {
            HStack(spacing: 4) {
                L10n.ends
                CountdownView(date: viewModel.sessionDetail.dateRange.upperBound)
            }
        }
    }

    @ViewBuilder
    var weatherInfo: some View {
        if let forecasts = viewModel.sessionDetail.forecast?
            .filter({ !$0.doesPrecedeSession }),
            !forecasts.isEmpty {
            VStack(spacing: 16) {
                ForEach(forecasts, id: \.self) { forecast in
                    let weather = forecast.weather
                    HStack {
                        if forecasts.count > 1 {
                            Text(forecast.date.formatted(date: .omitted, time: .shortened))
                                .font(.footnote)
                        }
                        Spacer()
                        gauges(for: weather)
                        Spacer()
                        WindView(wind: weather.wind,
                                 event: viewModel.sessionDetail.event)
                        if forecasts.count == 1 {
                            Spacer()
                        }
                    }
                    if forecast != forecasts.last {
                        Divider()
                    }
                }
            }
        } else {
            L10n.Forecast.notYet
        }
    }

    func gauges(for weather: Weather) -> some View {
        VStack {
            HStack {
                StyledGauge(inputType: .temperature,
                            value: weather.temperature.converted(to: .celsius).value,
                            valueText: weather.temperatureRoundedFormatted)
                if let humidity = weather.humidity {
                    StyledGauge(inputType: .humidity,
                                value: humidity,
                                valueText: (humidity * 100).rounded().formatted() + "%")
                }
            }
            HStack {
                if let cloudCover = weather.cloudCover {
                    StyledGauge(inputType: .cloudCover,
                                value: cloudCover,
                                valueText: (cloudCover * 100).rounded().formatted() + "%")
                }
                StyledGauge(inputType: .rainAmount,
                            value: weather.rain.amount.converted(to: .millimeters).value,
                            valueText: weather.rainAmountRoundedFormatted)
                StyledGauge(inputType: .rainChance,
                            value: weather.rain.chance,
                            valueText: (weather.rain.chance * 100).rounded().formatted() + "%")
            }
        }
    }

    @ViewBuilder
    var chanceChart: some View {
        VStack(spacing: 4) {
            L10n.SessionDetail.rainChance
                .font(.headline)
            Chart {
                ForEach(viewModel.rainDetail, id: \.self) {
                    BarMark(
                        x: .value(L10n.Chart.time, $0.date),
                        y: .value(L10n.Chart.chance, $0.chance)
                    )
                }
            }
            .chartPlotStyle {
                $0
                    .frame(height: 160)
                    .foregroundColor(.chartBar)
            }
        }
    }

    @ViewBuilder
    var intensityChart: some View {
        VStack(spacing: 4) {
            L10n.SessionDetail.rainIntensity
                .font(.headline)
            Chart {
                ForEach(viewModel.rainDetail, id: \.self) {
                    BarMark(
                        x: .value(L10n.Chart.time, $0.date),
                        y: .value(L10n.Chart.intensity, $0.intensity.value)
                    )
                }
            }
            .chartPlotStyle {
                $0
                    .frame(height: 160)
                    .foregroundColor(.chartBar)
            }
        }
    }
}

// MARK: - Preview
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
