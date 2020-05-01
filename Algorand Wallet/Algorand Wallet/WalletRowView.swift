//
//  WalletRowView.swift
//  Algorand Wallet
//
//  Created by Yathi on 1/5/20.
//  Copyright © 2020 Agoda. All rights reserved.
//

import SwiftUI

struct WalletRowView: View {
    var wallet: Wallet

    var body: some View {
        VStack {
            Spacer()

            HStack(alignment: .center) {
                Image("wallet")
                    .resizable()
                    .aspectRatio(1.0, contentMode: .fit)
                    .frame(width: 32, height: 32)
                    .fixedSize(horizontal: true, vertical: true)

                VStack(alignment: .leading) {
                    Text(wallet.name)
                        .fontWeight(.bold)
                        .truncationMode(.tail)
                        .frame(minWidth: 20)

                    Text(wallet.description)
                        .font(.caption)
                        .opacity(0.625)
                        .truncationMode(.middle)
                }

                Spacer()

                if wallet.isFavorite {
                   Image("star-filled")
                       .resizable()
                       .renderingMode(.template)
                       .foregroundColor(.yellow)
                       .frame(width: 10, height: 10)
                }
            }

            Spacer()
        }
    }
}

struct WalletRowView_Previews: PreviewProvider {
    static var previews: some View {
        WalletRowView(wallet: walletData[0])
    }
}
