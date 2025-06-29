//
//  ScrollableCollectionView.swift
//  Utilix
//
//  Created by Aditya Patole on 09/06/25.
//

import SwiftUI
import UIKit

struct ScrollableCollectionView: UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    func makeUIView(context: Context) -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 100, height: 100)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = context.coordinator
        collectionView.dataSource = context.coordinator
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")

        return collectionView
    }

    func updateUIView(_ uiView: UICollectionView, context: Context) {}

    class Coordinator: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate {
        var lastOffsetY: CGFloat = 0

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 50
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
            cell.backgroundColor = .systemBlue
            return cell
        }

        // Scroll delegate
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let offsetY = scrollView.contentOffset.y
            if offsetY > lastOffsetY {
                print("Scrolling Down")
            } else if offsetY < lastOffsetY {
                print("Scrolling Up")
            }
            lastOffsetY = offsetY
        }
    }
}
