//
//  WalletList.swift
//  Algorand Wallet
//
//  Created by Yathi on 1/5/20.
//  Copyright © 2020 Agoda. All rights reserved.
//

import SwiftUI

struct WalletList: View {
    @EnvironmentObject private var userData: UserData
    @Binding var selectedWallet: Wallet?
    @Binding var filter: FilterType

    var body: some View {
        List(selection: $selectedWallet) {
            ForEach(userData.wallets) { wallet in
                if (!self.userData.showFavoritesOnly || wallet.isFavorite)
                && (self.filter == .all
                    || self.filter.category == wallet.category
                    || (self.filter.category == .featured && wallet.isFeatured)) {
                WalletRowView(wallet: wallet)
                    .tag(wallet)
                }
            }
        }
    }
}

struct WalletList_Previews: PreviewProvider {
    static var previews: some View {
        WalletList(selectedWallet: .constant(walletData[0]),
                   filter: .constant(.all))
            .environmentObject(UserData())
    }
}
