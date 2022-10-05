//
//  StyledGauge.swift
//  
//
//  Created by Lukas Ruzicka on 12.10.2022.
//

import SwiftUI

struct StyledGauge: View {

    // MARK: - Subtypes
    enum InputType {

        case temperature
        case humidity
        case cloudCover
        case rainAmount
        case rainChance
        case windSpeed
    }

    enum ExtremesType {

        case rising
        case midIdeal
    }

    // MARK: - Properties
    let inputType: InputType
    let value: Double
    var valueText: String?

    private let extremeColor: Color = .Scale.extreme
    private let midColor: Color = .Scale.mid
    private let fineColor: Color = .Scale.fine

    // MARK: - Body
    var body: some View {
        Gauge(value: value.clamped(to: range), in: range) {
            label
                .padding(2)
                .foregroundColor(.Text.primary)
        } currentValueLabel: {
            Text(valueText ?? value.formatted())
                .foregroundColor(valueColor)
                .shadow(color: .shadow, radius: 1)
        }
        .gaugeStyle(.accessoryCircular)
        .tint(Gradient(colors: gradientColors))
    }
}

// MARK: - Computed
private extension StyledGauge {

    var range: ClosedRange<Double> {
        switch inputType {
        case .temperature:
            let lowerBound = Measurement<UnitTemperature>(value: 10, unit: .celsius)
            let upperBound = Measurement<UnitTemperature>(value: 35, unit: .celsius)
            return lowerBound.value...upperBound.value
        case .humidity:
            return 0.25...0.7
        case .cloudCover, .rainChance:
            return 0...1
        case .rainAmount:
            return 0...4
        case .windSpeed:
            return 0...50
        }
    }

    var label: Text {
        switch inputType {
        case .temperature:
            return L10n.WeatherProperty.Temperature.short
        case .humidity:
            return L10n.WeatherProperty.Humidity.short
        case .cloudCover:
            return L10n.WeatherProperty.CloudCover.short
        case .rainAmount:
            return L10n.WeatherProperty.RainAmount.short
        case .rainChance:
            return L10n.WeatherProperty.RainChance.short
        case .windSpeed:
            return L10n.WeatherProperty.WindSpeed.short
        }
    }

    var gradientColors: [Color] {
        switch extremesType {
        case .midIdeal:
            return [extremeColor, midColor, fineColor, midColor, extremeColor]
        case .rising:
            return [fineColor, midColor, extremeColor]
        }
    }

    var valueColor: Color {
        switch extremesType {
        case .midIdeal:
            switch value {
            case rangePercentualValue(0.4)...rangePercentualValue(0.6):
                return fineColor
            case rangePercentualValue(0.2)...rangePercentualValue(0.4),
                rangePercentualValue(0.6)...rangePercentualValue(0.8):
                return midColor
            default:
                return extremeColor
            }
        case .rising:
            switch value {
            case range.lowerBound...rangePercentualValue(0.33):
                return fineColor
            case rangePercentualValue(0.33)...rangePercentualValue(0.66):
                return midColor
            default:
                return extremeColor
            }
        }
    }

    func rangePercentualValue(_ percent: Double) -> Double {
        range.lowerBound + (range.upperBound - range.lowerBound) * percent
    }

    var extremesType: ExtremesType {
        switch inputType {
        case .temperature, .humidity:
            return .midIdeal
        case .cloudCover, .rainAmount, .rainChance, .windSpeed:
            return .rising
        }
    }
}

// MARK: - Preview
struct StyledGauge_Previews: PreviewProvider {

    static var previews: some View {
        VStack(spacing: 24) {
            StyledGauge(inputType: .rainChance, value: 0, valueText: "Zero")
            StyledGauge(inputType: .rainChance, value: 0.25)
            StyledGauge(inputType: .rainChance, value: 0.5)
            StyledGauge(inputType: .rainChance, value: 0.75)
            StyledGauge(inputType: .rainChance, value: 1, valueText: "Full")
        }
        .padding()
    }
}
