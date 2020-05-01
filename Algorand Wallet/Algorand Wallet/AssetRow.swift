//
//  AssetRow.swift
//  Algorand Wallet
//
//  Created by Yathi on 1/5/20.
//  Copyright © 2020 Agoda. All rights reserved.
//

import SwiftUI

struct AssetRow: View {
    var asset: Asset

    var body: some View {
        VStack(alignment: .leading) {
            Spacer()

            Text(asset.name)
                .font(.headline)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)

            Spacer()
        }
        .padding(.leading, 16)
    }
}

struct AssetRow_Previews: PreviewProvider {
    static var previews: some View {
        AssetRow(asset: walletData[0].assets[0])
    }
}
