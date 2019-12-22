//
//  MapView.swift
//  StudyGroupEventFetcherForSwiftUI
//
//  Created by Takuya Aso on 2019/12/23.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        let center = CLLocationCoordinate2DMake(35.641587300000, 139.669071500000)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: center, span: span)
        mapView.setRegion(region, animated: true)
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        return mapView
    }

    // Required
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
