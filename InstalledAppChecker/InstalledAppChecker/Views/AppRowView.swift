//
//  AppRowView.swift
//  InstalledAppChecker
//
//  Created by NIKHIL on 18/06/25.
//

import SwiftUI

struct AppRowView: View {
    let item: AppStatus

    var body: some View {
        HStack(spacing: 16) {
            Image(item.app.iconAssetName)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .clipShape(RoundedRectangle(cornerRadius: 10))

            VStack(alignment: .leading, spacing: 4) {
                Text(item.app.name)
                    .font(.headline)
            }

            Spacer()

            HStack(spacing: 4) {
                Image(systemName: item.isInstalled ? "checkmark.seal.fill" : "xmark.octagon.fill")
                    .foregroundColor(item.isInstalled ? .green : .red)
                Text(item.isInstalled ? "Installed" : "Not Installed")
                    .font(.subheadline)
                    .foregroundColor(item.isInstalled ? .green : .red)
            }
        }
        .padding(.vertical, 6)
    }
}
