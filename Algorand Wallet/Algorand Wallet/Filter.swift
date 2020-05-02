//
//  Filter.swift
//  Algorand Wallet
//
//  Created by Yathi on 1/5/20.
//  Copyright © 2020 Agoda. All rights reserved.
//

import SwiftUI

struct Filter: View {
    @EnvironmentObject private var userData: UserData
    @Binding var filter: FilterType

    var body: some View {
        HStack {
            Picker(selection: $filter, label: EmptyView()) {
                ForEach(FilterType.allCases) { choice in
                    Text(choice.name).tag(choice)
                }
            }
            Toggle(isOn: $userData.showFavoritesOnly) {
                Text("Favorites")
            }
        }
    }
}

struct Filter_Previews: PreviewProvider {
    static var previews: some View {
        Filter(filter: .constant(.all))
        .environmentObject(UserData())
    }
}

struct FilterType: Hashable, CaseIterable, Identifiable {
    var name: String
    var category: Wallet.Category?

    init(_ category: Wallet.Category) {
        self.name = category.rawValue
        self.category = category
    }

    init(name: String) {
        self.name = name
        self.category = nil
    }

    static var all = FilterType(name: "All")

    static var allCases: [FilterType] {
        return [.all] + Wallet.Category.allCases.map(FilterType.init)
    }

    var id: FilterType {
        return self
    }
}
