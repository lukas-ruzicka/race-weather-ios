//
//  LiveSessionThumbnail.swift
//  
//
//  Created by Lukas Ruzicka on 15.10.2022.
//

import Charts
import DomainLayer
import SwiftUI

struct LiveSessionThumbnail: View {

    // MARK: - Properties
    let data: LiveSessionData

    private var weather: [Weather] { data.sessionDetail.forecast?.map(\.weather) ?? [] }

    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            LiveLabel()
                .padding(.leading, 8)
            VStack {
                HStack(alignment: .top) {
                    EventLabel(event: data.sessionDetail.event, sessionType: data.sessionDetail.type)
                    Spacer()
                    HStack(spacing: 4) {
                        L10n.ends
                            .font(.caption)
                        CountdownView(date: data.sessionDetail.dateRange.upperBound)
                            .font(.caption)
                    }
                }
                weatherInfo
            }
            .cardBackground()
        }
        .foregroundColor(.Text.primary)
    }
}

// MARK: - Subviews
private extension LiveSessionThumbnail {

    var weatherInfo: some View {
        HStack {
            StyledGauge(inputType: .temperature,
                        value: weather.averageTemperature,
                        valueText: weather.averageTemperatureFormatted)
            StyledGauge(inputType: .windSpeed,
                        value: weather.averageWindSpeed,
                        valueText: weather.averageWindSpeedFormatted)
            if !data.rainDetail.isEmpty {
                Spacer(minLength: 24)
                rainChart
            } else {
                StyledGauge(inputType: .rainAmount,
                            value: weather.averageRainAmount,
                            valueText: weather.averageRainAmountFormatted)
            }
        }
    }

    var rainChart: some View {
        Chart {
            ForEach(data.rainDetail, id: \.self) {
                BarMark(
                    x: .value(L10n.Chart.time, $0.date),
                    y: .value(L10n.Chart.intensity, $0.intensity.value)
                )
            }
        }
        .chartYAxis(.hidden)
        .chartXAxis {
            AxisMarks(
                values: .automatic(desiredCount: 2)
            )
        }
        .chartPlotStyle {
            $0
                .frame(height: 64)
                .foregroundColor(.chartBar)
        }
    }
}

// MARK: - Preview
struct LiveSessionThumbnail_Previews: PreviewProvider {

    static var previews: some View {
        VStack(spacing: 24) {
            LiveSessionThumbnail(data: .init(sessionDetail: .mockFP1, rainDetail: RainDetail.mock(for: SessionDetail.mockFP1.dateRange)))
            LiveSessionThumbnail(data: .init(sessionDetail: .mockQualifying, rainDetail: RainDetail.mock(for: SessionDetail.mockQualifying.dateRange)))
            LiveSessionThumbnail(data: .init(sessionDetail: .mockRace, rainDetail: []))
        }
        .padding()
    }
}
