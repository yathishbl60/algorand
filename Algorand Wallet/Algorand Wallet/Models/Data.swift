//
//  Asset.swift
//  Algorand Wallet
//
//  Created by Yathi on 1/5/20.
//  Copyright © 2020 Agoda. All rights reserved.
//

import Foundation
import SwiftUI

let walletData: [Wallet] = [
    Wallet(
        id: 1,
        name: "Wallet 1",
        category: .featured,
        isFavorite: true,
        isFeatured: true,
        description: "This one is wallet 1 description",
        assets: [
            Asset(id: "1", name: "Algorand", symbol: "ALG", amount: 159234.60),
            Asset(id: "2", name: "Tether", symbol: "USDT", amount: 500.45),
            Asset(id: "3", name: "Asia reserve currency", symbol: "ARCC", amount: 4500.34)
        ]
    ),
    Wallet(
        id: 2,
        name: "Wallet 2",
        category: .featured,
        isFavorite: true,
        isFeatured: true,
        description: "This one is wallet 2 description",
        assets: [
            Asset(id: "1", name: "Algorand", symbol: "ALG", amount: 159234.60),
            Asset(id: "2", name: "Tether", symbol: "USDT", amount: 500.45),
            Asset(id: "3", name: "Asia reserve currency", symbol: "ARCC", amount: 4500.34)
        ]
    ),
    Wallet(
        id: 3,
        name: "Wallet 3",
        category: .business,
        isFavorite: false,
        isFeatured: false,
        description: "This one is wallet 3 description",
        assets: [
            Asset(id: "1", name: "Algorand", symbol: "ALG", amount: 159234.60),
            Asset(id: "2", name: "Tether", symbol: "USDT", amount: 500.45),
            Asset(id: "3", name: "Asia reserve currency", symbol: "ARCC", amount: 4500.34)
        ]
    ),
    Wallet(
        id: 4,
        name: "Wallet 4",
        category: .testing,
        isFavorite: false,
        isFeatured: false,
        description: "This one is wallet 4 description",
        assets: [
            Asset(id: "1", name: "Algorand", symbol: "ALG", amount: 159234.60),
            Asset(id: "2", name: "Tether", symbol: "USDT", amount: 500.45),
            Asset(id: "3", name: "Asia reserve currency", symbol: "ARCC", amount: 4500.34)
        ]
    )
]
let features = walletData.filter { $0.isFeatured }
