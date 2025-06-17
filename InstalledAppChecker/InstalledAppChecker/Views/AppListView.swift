//
//  AppListView.swift
//  InstalledAppChecker
//
//  Created by NIKHIL on 18/06/25.
//

import SwiftUI

struct AppListView: View {
    @StateObject private var viewModel = AppListViewModel()
    @State private var appearedApps: Set<UUID> = []

    var groupedApps: [String: [AppStatus]] {
        Dictionary(grouping: viewModel.apps, by: { $0.app.category })
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(groupedApps.keys.sorted(), id: \.self) { category in
                    Section(header: Text(category)
                        .font(.title3.bold())
                        .foregroundColor(.primary)) {
                        ForEach(groupedApps[category] ?? []) { item in
                            AppRowView(item: item)
                                .opacity(appearedApps.contains(item.id) ? 1 : 0)
                                .offset(y: appearedApps.contains(item.id) ? 0 : 20)
                                .animation(
                                    .easeOut(duration: 0.4)
                                    .delay(Double(viewModel.apps.firstIndex(where: { $0.id == item.id }) ?? 0) * 0.05),
                                    value: appearedApps
                                )
                                .onAppear {
                                    appearedApps.insert(item.id)
                                }
                        }
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Installed Apps")
        }
    }
}
