//
//  CustomMenuView.swift
//  LocalNotification
//
//  Created by Aditya Patole on 29/05/25.
//

import SwiftUI


struct CustomMenuView<Content: View>: View {
//    @ViewBuilder var content: Content
    
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
//    CustomMenuView()
}

// Menu Config
struct MenuConfig {
    var symbolImage: String
    var sourceLocation: CGRect = .zero
    var showMenu: Bool = false
    var hideSouceView: Bool = false
}

// Menu Action & Action Builder
struct MenuAction: Identifiable {
    private(set) var id: String = UUID().uuidString
    var symbolImage: String
    var text: String
    var action: () -> ()
}

@resultBuilder
struct MenuActionBuilder {
    static func buildBlock(_ components: MenuAction...) -> [MenuAction] {
        components.compactMap { $0 }
    }
}
