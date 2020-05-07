//
//  EventDetailMapButtonView.swift
//  StudyGroupEventFetcherForSwiftUI
//
//  Created by Takuya Aso on 2020/05/06.
//  Copyright © 2020 Takuya Aso. All rights reserved.
//

import SwiftUI

struct EventDetailMapButtonView: View {

    @Binding var zoomValue: Double

    var body: some View {
        VStack {
            Button(action: {
                // マップ拡大
                self.zoomValue *= 0.5
            }) {
                Image(systemName: "plus.app.fill")
                    .resizable()
                    .frame(width: 30.0, height: 30.0)
                    .foregroundColor(.gray)
            }
            Button(action: {
                // マップ縮小
                self.zoomValue *= 2
            }) {
                Image(systemName: "minus.square.fill")
                    .resizable()
                    .frame(width: 30.0, height: 30.0)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct EventDetailMapButtonView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailMapButtonView(zoomValue: .constant(0.01))
    }
}
