//
//  WalletMaster.swift
//  Algorand Wallet
//
//  Created by Yathi on 1/5/20.
//  Copyright © 2020 Agoda. All rights reserved.
//

import SwiftUI

struct WalletMaster: View {
    @Binding var selectedWallet: Wallet?
    @State private var filter: FilterType = .all

    var body: some View {
        VStack {
            Spacer()
            Filter(filter: $filter)
                .controlSize(.small)
                .padding([.top, .leading], 8)
                .padding(.trailing, 4)
            Spacer()
            Divider()
            WalletList(
                selectedWallet: $selectedWallet,
                filter: $filter
            )
            .listStyle(SidebarListStyle())
        }
    }
}

struct WalletMaster_Previews: PreviewProvider {
    static var previews: some View {
        WalletMaster(selectedWallet: .constant(walletData[1]))
        .environmentObject(UserData())
    }
}

