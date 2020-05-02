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
            HStack {
                Text(asset.name)
                    .font(.body)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.leading)
                    .truncationMode(.tail)
                Spacer()
                Text(asset.symbol)
                    .font(.subheadline)
                    .fontWeight(.light)
                    .multilineTextAlignment(.trailing)
            }

            Text("\(asset.amount)")
                .fontWeight(.regular)
                .multilineTextAlignment(.leading)
            

            Divider()
        }
    }
}

struct AssetRow_Previews: PreviewProvider {
    static var previews: some View {
        AssetRow(asset: walletData[0].assets[0]).frame(width: 250)
    }
}
