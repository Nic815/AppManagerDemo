//
//  AppModel.swift
//  InstalledAppChecker
//
//  Created by NIKHIL on 18/06/25.
//

import Foundation

struct AppInfo: Identifiable {
    let id = UUID()
    let name: String
    let scheme: String
    let category: String
    let iconAssetName: String 
}
