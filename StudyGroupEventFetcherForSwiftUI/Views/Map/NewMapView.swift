//
//  NewMapView.swift
//  StudyGroupEventFetcherForSwiftUI
//
//  Created by Takuya Aso on 2022/12/19.
//  Copyright © 2022 Takuya Aso. All rights reserved.
//

import SwiftUI
import MapKit

struct NewMapView: View {
    // リスト画面から渡ってくる勉強会情報
    let eventData: Event
    // 詳細画面のマップの右下の+ - ボタンで変わるズームの値
    @Binding var zoomValue: CLLocationDegrees

    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.6816005869028, longitude: 139.76595878344898), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))

    var body: some View {
        Map(
            coordinateRegion: $region,
            annotationItems: generatePinItem()) { item in
                MapMarker(coordinate: item.coordinate)
            }
        .onAppear {
            setTargetRegion()
        }
        .onChange(of: zoomValue) { newValue in
            // + - ボタンでズームの値が変わるのでその変化を検知してマップの拡大縮小を行う
            region.span = MKCoordinateSpan(latitudeDelta: zoomValue, longitudeDelta: zoomValue)
        }
    }
}

extension NewMapView {
    /// アノテーション用のデータを生成
    private func generatePinItem() -> [PinItem] {
        guard let latitude = eventData.lat,
              let latValue = Double(latitude),
              let longitude = eventData.lon,
              let lonValue = Double(longitude) else {
            return []
        }
        return [PinItem(coordinate: CLLocationCoordinate2D(latitude: latValue, longitude: lonValue))]
    }

    /// 表示時にマップの中央を会場の場所にする
    private func setTargetRegion() {
        guard let latitude = eventData.lat,
              let latValue = Double(latitude),
              let longitude = eventData.lon,
              let lonValue = Double(longitude) else {
            // オンライン開催などで緯度経度の情報がnilの場合広域にしておく
            region.span = MKCoordinateSpan(latitudeDelta: 30, longitudeDelta: 30)
            return
        }
        // マップの中央を会場に
        region.center = CLLocationCoordinate2D(latitude: latValue, longitude: lonValue)
    }
}

struct NewMapView_Previews: PreviewProvider {
    static var previews: some View {
        NewMapView(eventData: mockEventsData[0], zoomValue: .constant(0.01))
    }
}
