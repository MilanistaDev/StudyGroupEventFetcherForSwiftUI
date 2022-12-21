//
//  LoadingViewModifier.swift
//  StudyGroupEventFetcherForSwiftUI
//
//  Created by Takuya Aso on 2022/12/17.
//  Copyright © 2022 Takuya Aso. All rights reserved.
//

import SwiftUI

/// ローディング画面を出すViewModifier
struct LoadingViewModifier: ViewModifier {
    var isRefreshing: Bool

    func body(content: Content) -> some View {
        ZStack {
            content
                .allowsHitTesting(!isRefreshing)

            if isRefreshing {
                ProgressView {
                    Text("Loading...")
                }
            }
        }
    }
}

extension View {
    /// 通信中にProgressViewを表示
    /// - Parameters:
    ///   - isRefreshing: 通信中か
    /// - Returns: ローディング画面
    func loading(isRefreshing: Bool, safeAreaEdges: Edge.Set = []) -> some View {
        modifier(LoadingViewModifier(isRefreshing: isRefreshing))
    }
}
