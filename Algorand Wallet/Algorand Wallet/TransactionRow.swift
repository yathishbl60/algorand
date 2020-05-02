//
//  TransactionRow.swift
//  Algorand Wallet
//
//  Created by Yathi on 2/5/20.
//  Copyright © 2020 Agoda. All rights reserved.
//

import SwiftUI

struct TransactionRow: View {

    var body: some View {
        VStack(alignment: .leading) {
            Text("QLEKN2UIUBVZ2N7Y3HAGJFN3MMH4WJ5WOGPJNCH3A6D6NV7XEBJORHMN2I").truncationMode(.middle)
            Text("$100")
                .foregroundColor(Color.orange)
            Text("May 01,2020")
                .font(.caption)
                .fontWeight(.thin)
            Divider()
        }
    }
}

struct TransactionRow_Previews: PreviewProvider {
    static var previews: some View {
        TransactionRow()
    }
}
