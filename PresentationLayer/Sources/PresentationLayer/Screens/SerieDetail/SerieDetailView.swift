//
//  SerieDetailView.swift
//  
//
//  Created by Lukas Ruzicka on 13.08.2022.
//

import DomainLayer
import SwiftUI
import Utils

public struct SerieDetailView: View {

    // MARK: - Properties
    @ObservedObject var viewModel: SerieDetailViewModel

    // MARK: - Body
    public var body: some View {
        List {
            Section {
                if let events = viewModel.events, !events.isEmpty {
                    ForEach(events, id: \.self) {
                        eventRow($0)
                    }
                } else if !viewModel.isLoading && viewModel.events != nil {
                    noComingEvents
                }
            }
        }
        .animation(.default, value: viewModel.events)
        .foregroundColor(.Text.primary)
        .background(Color.Background.secondary)
        .navigationTitle(viewModel.serie.name)
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
private extension SerieDetailView {

    func eventRow(_ event: Event) -> some View {
        NavigationLink {
            Resolver.resolve(EventDetailView.self, args: event)
        } label: {
            HStack {
                event.flagImage
                Text(event.name)
                Spacer()
                if event.sessions.contains(where: { $0.isLive }) {
                    LiveLabel()
                }
                CountdownView(date: event.start)
                    .font(.caption)
            }
        }
    }

    var noComingEvents: some View {
        VStack {
            L10n.noEvents
        }
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Preview
struct SerieDetailView_Previews: PreviewProvider {

    static var previews: some View {
        SerieDetailView(viewModel: .init(serie: .formula1))
            .previewDisplayName("Formula 1")
        SerieDetailView(viewModel: .init(serie: .motogp))
            .previewDisplayName("MotoGP")
    }
}
