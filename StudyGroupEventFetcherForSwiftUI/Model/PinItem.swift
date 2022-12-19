//
//  PinItem.swift
//  StudyGroupEventFetcherForSwiftUI
//
//  Created by Takuya Aso on 2022/12/19.
//  Copyright © 2022 Takuya Aso. All rights reserved.
//

import Foundation
import MapKit

struct PinItem: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}
