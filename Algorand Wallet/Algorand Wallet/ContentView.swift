//
//  ContentView.swift
//  Algorand Wallet
//
//  Created by Yathi on 25/4/20.
//  Copyright © 2020 Agoda. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedWallet: Wallet?
    @State private var selectedAsset: Asset?

    var body: some View {
        NavigationView {
            WalletMaster(selectedWallet: $selectedWallet)
                .frame(minWidth: 225)

            if selectedWallet != nil {
                NavigationView {
                    AssetsView(wallet: selectedWallet!, selectedAsset: $selectedAsset)
                        .frame(minWidth: 200, maxWidth: 300, minHeight: 600)

                    if selectedAsset != nil {
                        AssetDetailView(asset: selectedAsset!)
                            .frame(minWidth: 400)
                    } else {
                        AssetEmptyView()
                            .frame(minWidth: 400)
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserData())
    }
}
