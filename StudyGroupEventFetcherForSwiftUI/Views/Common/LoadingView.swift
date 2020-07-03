//
//  LoadingView.swift
//  StudyGroupEventFetcherForSwiftUI
//
//  Created by Takuya Aso on 2020/07/02.
//  Copyright © 2020 Takuya Aso. All rights reserved.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .fill(Color.gray)
                .frame(width: 100.0, height: 100.0, alignment: .center)
            VStack {
                Text("💫")
                    .padding(.bottom, 10.0)
                    .font(.title)
                Text("Loading...")
                    .font(.body)
                    .bold()
                    .foregroundColor(.white)
            }
        }
    }
}
struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
