//
//  EventLabel.swift
//  
//
//  Created by Lukas Ruzicka on 15.10.2022.
//

import DomainLayer
import SwiftUI

struct EventLabel: View {

    // MARK: - Properties
    let event: Event
    var sessionType: SessionType?

    // MARK: - Body
    var body: some View {
        HStack {
            event.serie.icon
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(size: 24)
                .padding(.trailing, 8)
            event.flagImage
            VStack(alignment: .leading, spacing: 4) {
                Text(event.name)
                    .multilineTextAlignment(.leading)
                if let sessionType {
                    sessionType.name
                        .font(.footnote)
                }
            }
            .padding(.horizontal, 4)
        }
        .font(.headline)
    }
}

// MARK: - Preview
struct EventLabel_Previews: PreviewProvider {

    static var previews: some View {
        EventLabel(event: .mockFormula1BelgianGP)
        EventLabel(event: .mockFormula1BelgianGP, sessionType: .practice(number: 2))
    }

}
