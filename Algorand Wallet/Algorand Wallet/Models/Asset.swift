//
//  Asset.swift
//  Algorand Wallet
//
//  Created by Yathi on 1/5/20.
//  Copyright © 2020 Agoda. All rights reserved.
//

import Foundation

struct Asset: Hashable, Identifiable, Codable {
    var id: String
    var name: String
    var symbol: String
    var amount: Double
}
