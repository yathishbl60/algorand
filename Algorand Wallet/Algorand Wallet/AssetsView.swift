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

     @State private var searchTextWrapper = AssetsSearchTextWrapper()
    @State private var isSearching = false

    var body: some View {
        VStack {
            Spacer()
            searchField
                .padding(.leading)
                .frame(height: 44)
            Spacer()
            List(selection: $selectedAsset) {
                ForEach(wallet.assets) { asset in
                    AssetRow(asset: asset)
                        .tag(asset)
                }
            }
//            .listStyle(SidebarListStyle())
        }
    }

    private var searchField: some View {
        SearchField(searchTextWrapper: searchTextWrapper,
                    placeholder: "Search any asset",
                    isSearching: $isSearching)
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


final class AssetsSearchPageListener: AssetsPagesListener {
    var text: String?

    override func loadPage() {
       
    }
}

final class AssetsSearchTextWrapper: SearchTextObservable {
    var searchPageListener = AssetsSearchPageListener()

    override func onUpdateTextDebounced(text: String) {
        searchPageListener.text = text
        searchPageListener.currentPage = 1
    }
}

class AssetsPagesListener {
    var currentPage: Int = 1 {
        didSet {
            loadPage()
        }
    }

    func loadPage() {

    }
}

