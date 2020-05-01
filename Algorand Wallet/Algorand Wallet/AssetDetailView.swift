//
//  AssetDetailView.swift
//  Algorand Wallet
//
//  Created by Yathi on 1/5/20.
//  Copyright © 2020 Agoda. All rights reserved.
//

import SwiftUI

struct AssetDetailView: View {
    var asset: Asset

    var body: some View {
        VStack(spacing: 10.0) {
            Text(asset.name)
                .font(.headline)
                .multilineTextAlignment(.leading)
            Text(asset.amount.description)
                .font(.largeTitle)
                .multilineTextAlignment(.leading)
            HStack(spacing: 32.0) {
                Button(action: {}) {
                    Text("Send")
                    .frame(width: 120.0, height: 32)
                }
                .buttonStyle(NiceButtonStyle(foregroundColor: .white, backgroundColor: .orange, pressedColor: .orange))

                Button(action: {}) {
                    Text("Request")
                    .frame(width: 120.0, height: 32)
                }
                .buttonStyle(NiceButtonStyle(foregroundColor: .white, backgroundColor: .green, pressedColor: .green))
            }

            Divider()
            HStack {
                Text("Rewards earned since last transaction")
                    .font(.body)
                Text("12.4")
                    .font(.body)
                    .lineLimit(nil)
            }

            List {
                Text("Transaction 1")
                Text("Transaction 2")
                Text("Transaction 3")
                Text("Transaction 4")
                Text("Transaction 5")
            }

        }
        .padding(.top, 16)
        .frame(maxWidth: .infinity)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        AssetDetailView(asset: walletData[0].assets[0])
    }
}

struct NiceButtonStyle: ButtonStyle {
    var foregroundColor: Color
    var backgroundColor: Color
    var pressedColor: Color

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.body)
            .foregroundColor(foregroundColor)
            .background(configuration.isPressed ? pressedColor : backgroundColor)
            .cornerRadius(20)
    }
}
