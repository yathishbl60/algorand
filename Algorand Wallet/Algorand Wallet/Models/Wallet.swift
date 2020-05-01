//
//  Asset.swift
//  Algorand Wallet
//
//  Created by Yathi on 1/5/20.
//  Copyright © 2020 Agoda. All rights reserved.
//

import SwiftUI
import CoreLocation

struct Wallet: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var category: Category
    var isFavorite: Bool
    var isFeatured: Bool
    var description: String
    var assets: [Asset]

    enum Category: String, CaseIterable, Codable, Hashable {
        case featured = "Personal"
        case business = "Business"
        case testing = "Testing"
    }
}
