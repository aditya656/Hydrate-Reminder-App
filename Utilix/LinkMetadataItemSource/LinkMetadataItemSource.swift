//
//  LinkMetadataItemSource.swift
//  Utilix
//
//  Created by Aditya Patole on 22/05/25.
//

import UIKit
import LinkPresentation

class LinkMetadataItemSource: NSObject, UIActivityItemSource {
    let url: URL
    let title: String
    let subtitle: String
    let image: UIImage

    init(url: URL, title: String, subtitle: String, image: UIImage) {
        self.url = url
        self.title = title
        self.subtitle = subtitle
        self.image = image
    }

    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        return url
    }

    func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
        return url
    }

    func activityViewControllerLinkMetadata(_ activityViewController: UIActivityViewController) -> LPLinkMetadata? {
        let metadata = LPLinkMetadata()
        metadata.originalURL = url
        metadata.url = url
        metadata.title = title

        let imageProvider = NSItemProvider(object: image)
        metadata.imageProvider = imageProvider
        metadata.iconProvider = imageProvider
        metadata.originalURL = URL(fileURLWithPath: subtitle)
        return metadata
    }
}
