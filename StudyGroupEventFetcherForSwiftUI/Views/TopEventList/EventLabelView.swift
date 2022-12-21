//
//  EventLabelView.swift
//  StudyGroupEventFetcherForSwiftUI
//
//  Created by Takuya Aso on 2020/06/27.
//  Copyright © 2020 Takuya Aso. All rights reserved.
//

import SwiftUI

enum ColorType {
    case multiColor
    case monochrome
}

struct EventLabelView: View {

    let labelName: String
    let iconName: String
    let colorType: ColorType

    var body: some View {
        HStack {
            switch colorType {
            case .monochrome:
                Image(systemName: iconName)
                    .imageScale(.medium)
                    .foregroundColor(.red)
            case .multiColor:
                if #available(iOS 14.0, *) {
                    Image(systemName: iconName)
                        .renderingMode(.original)
                        .imageScale(.medium)
                } else {
                    Image(systemName: iconName)
                        .imageScale(.medium)
                        .foregroundColor(.red)
                }
            }
            Text(labelName)
                .font(.footnote)
                .lineLimit(3)
                .fixedSize(horizontal: false, vertical: true)
        }.padding(.bottom, 6.0)
    }
}

struct EventLabelView_Previews: PreviewProvider {
    static var previews: some View {
        EventLabelView(labelName: mockEventsData[0].address,
                       iconName: "mappin.circle.fill",
                       colorType: .multiColor)
    }
}
