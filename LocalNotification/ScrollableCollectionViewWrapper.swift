//
//  ScrollableCollectionView.swift
//  LocalNotification
//
//  Created by Aditya Patole on 09/06/25.
//
import SwiftUI

struct ScrollableCollectionViewWrapper: View {
    var body: some View {
        VStack {
            Text("Wrapped UICollectionView")
                .font(.headline)
            ScrollableCollectionView()
                .frame(height: 400)
        }
    }
}
