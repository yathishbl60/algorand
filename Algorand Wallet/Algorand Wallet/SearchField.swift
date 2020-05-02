//
//  AssetsView.swift
//  Algorand Wallet
//
//  Created by Yathi on 2/5/20.
//  Copyright © 2020 Agoda. All rights reserved.
//

import SwiftUI
import Combine

public struct SearchField : View {
    @ObservedObject var searchTextWrapper: SearchTextObservable
    let placeholder: String
    @Binding var isSearching: Bool
    var dismissButtonTitle: String
    var dismissButtonCallback: (() -> Void)?

    private var searchCancellable: Cancellable? = nil

    public init(searchTextWrapper: SearchTextObservable,
                placeholder: String,
                isSearching: Binding<Bool>,
                dismissButtonTitle: String = "Cancel",
                dismissButtonCallback: (() -> Void)? = nil) {
        self.searchTextWrapper = searchTextWrapper
        self.placeholder = placeholder
        self._isSearching = isSearching
        self.dismissButtonTitle = dismissButtonTitle
        self.dismissButtonCallback = dismissButtonCallback

        self.searchCancellable = searchTextWrapper.searchSubject.sink(receiveValue: { value in
            isSearching.wrappedValue = !value.isEmpty
        })
    }

    public var body: some View {
        GeometryReader { reader in
            HStack(alignment: .center, spacing: 0) {
                Image(nsImage: NSImage(named: NSImage.touchBarSearchTemplateName)!)
                TextField(self.placeholder,
                          text: self.$searchTextWrapper.searchText)
                    .padding(.horizontal)
                if !self.searchTextWrapper.searchText.isEmpty {
                    Button(action: {
                        self.searchTextWrapper.searchText = ""
                        self.isSearching = false
                        self.dismissButtonCallback?()
                    }, label: {
                        Text(self.dismissButtonTitle).foregroundColor(.pink)
                    })
                        .buttonStyle(BorderlessButtonStyle())
                        .animation(.easeInOut)
                }
            }
            .preference(key: OffsetTopPreferenceKey.self,
                        value: reader.frame(in: .global).minY)
                .padding(4)
        }
    }
}

#if DEBUG
struct SearchField_Previews : PreviewProvider {
    static var previews: some View {
        let withText = SearchTextObservable()
        withText.searchText = "Test"

        return VStack {
            SearchField(searchTextWrapper: SearchTextObservable(),
                        placeholder: "Search anything",
                        isSearching: .constant(false))
            SearchField(searchTextWrapper: withText,
                        placeholder: "Search anything",
                        isSearching: .constant(false))

            List {
                SearchField(searchTextWrapper: withText,
                            placeholder: "Search anything",
                            isSearching: .constant(false))
                Section(header: SearchField(searchTextWrapper: withText,
                                            placeholder: "Search anything",
                                            isSearching: .constant(false)))
                {
                    SearchField(searchTextWrapper: withText,
                                placeholder: "Search anything",
                                isSearching: .constant(false))
                }
            }

            List {
                SearchField(searchTextWrapper: withText,
                            placeholder: "Search anything",
                            isSearching: .constant(false))
                Section(header: SearchField(searchTextWrapper: withText,
                                            placeholder: "Search anything",
                                            isSearching: .constant(false)))
                {
                    SearchField(searchTextWrapper: withText,
                                placeholder: "Search anything",
                                isSearching: .constant(false))
                }
            }
        }
    }
}
#endif

public struct OffsetTopPreferenceKey: PreferenceKey {
    static public var defaultValue: CGFloat = 0
    public typealias Value = CGFloat

    static public func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
