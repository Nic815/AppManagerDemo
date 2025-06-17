//
//  AppListViewModel.swift
//  InstalledAppChecker
//
//  Created by NIKHIL on 18/06/25.
//

import Foundation
import UIKit

class AppListViewModel: ObservableObject {
    @Published var apps: [AppStatus] = []

    init() {
        loadApps()
    }

    func loadApps() {
        let knownApps: [AppInfo] = [
            AppInfo(name: "WhatsApp", scheme: "whatsapp://", category: "Social", iconAssetName: "whatsapp"),
            AppInfo(name: "YouTube", scheme: "youtube://", category: "Entertainment", iconAssetName: "youtube"),
            AppInfo(name: "Instagram", scheme: "instagram://", category: "Social", iconAssetName: "instagram"),
            AppInfo(name: "Facebook", scheme: "fb://", category: "Social", iconAssetName: "facebook"),
            AppInfo(name: "Twitter", scheme: "twitter://", category: "Social", iconAssetName: "twitter"),
            AppInfo(name: "Snapchat", scheme: "snapchat://", category: "Social", iconAssetName: "snapchat"),
            AppInfo(name: "Telegram", scheme: "tg://", category: "Social", iconAssetName: "telegram"),
            AppInfo(name: "Zoom", scheme: "zoomus://", category: "Productivity", iconAssetName: "zoom"),
            AppInfo(name: "Gmail", scheme: "googlegmail://", category: "Productivity", iconAssetName: "gmail"),
            AppInfo(name: "Slack", scheme: "slack://", category: "Work", iconAssetName: "slack")
        ]

        apps = knownApps.map { app in
            let isInstalled = canOpen(scheme: app.scheme)
            return AppStatus(app: app, isInstalled: isInstalled)
        }
    }

    private func canOpen(scheme: String) -> Bool {
        guard let url = URL(string: scheme) else { return false }
        return UIApplication.shared.canOpenURL(url)
    }
}

struct AppStatus: Identifiable {
    let id = UUID()
    let app: AppInfo
    let isInstalled: Bool
}
