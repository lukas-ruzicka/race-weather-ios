//
//  CountdownView.swift
//  
//
//  Created by Lukas Ruzicka on 19.10.2022.
//

import Foundation
import SwiftUI

struct CountdownView: View {

    // MARK: - Properties
    let date: Date

    // MARK: - Body
    var body: some View {
        if date > .now {
            TimelineView(.periodic(from: .now, by: 1.0)) { context in
                if date > context.date {
                    Text(formattedDiff(from: context.date))
                }
            }
        }
    }
}

// MARK: - Supporting functions
private extension CountdownView {

    func formattedDiff(from currentDate: Date) -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.dateTimeStyle = .numeric
        formatter.unitsStyle = .full
        return formatter.localizedString(for: date, relativeTo: currentDate)
    }
}

// MARK: - Preview
struct CountdownView_Previews: PreviewProvider {

    private static let nowPlus5Seconds = Calendar.current.date(byAdding: .second, value: 5, to: .now)!

    @ViewBuilder
    static var previews: some View {
        VStack(spacing: 24) {
            CountdownView(date: nowPlus5Seconds)
            CountdownView(date: Calendar.current.date(byAdding: .minute, value: 4, to: nowPlus5Seconds)!)
            CountdownView(date: Calendar.current.date(byAdding: .hour, value: 3, to: nowPlus5Seconds)!)
            CountdownView(date: Calendar.current.date(byAdding: .day, value: 2, to: nowPlus5Seconds)!)
            CountdownView(date: Calendar.current.date(byAdding: .month, value: 1, to: nowPlus5Seconds)!)
        }
    }
}
