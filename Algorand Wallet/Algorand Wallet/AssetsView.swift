//
//  AssetsView.swift
//  Algorand Wallet
//
//  Created by Yathi on 2/5/20.
//  Copyright © 2020 Agoda. All rights reserved.
//

import SwiftUI

struct AssetsView: View {

    var wallet: Wallet
    @EnvironmentObject var userData: UserData
    @Binding var selectedAsset: Asset?

    var body: some View {
        List(selection: $selectedAsset) {
            ForEach(wallet.assets) { asset in
                AssetRow(asset: asset)
                    .tag(asset)
            }
        }
    }
}


struct AssetsView_Previews: PreviewProvider {
    static var previews: some View {
        AssetsView(wallet: walletData[0], selectedAsset: .constant(walletData[0].assets[0]))
            .environmentObject(UserData())
    }
}

struct AssetEmptyView: View {

    var body: some View {
        Text("Please select asset")
        .frame(minWidth: 400)
    }

}
