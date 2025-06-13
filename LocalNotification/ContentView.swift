//
//  ContentView.swift
//  LocalNotification
//
//  Created by Aditya Patole on 14/01/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isMenuOpen = false
    @State private var selectedView: MenuOption = .waterNotification
    @StateObject var viewModel = WaterNotificationViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Main content view
                Group {
                    switch selectedView {
                    case .waterNotification:
                        WaterNotificationView(viewModel: viewModel)
                    case .home:
                        HomeView()
                    case .profile:
                        ProfileView()
                    case .settings:
                        SettingsView()
                    case .viewModifiersOne:
                        ViewModifiersOne()
                    case .scrollableCollectionView:
                        ScrollableCollectionViewWrapper()
                    }
                }
                .navigationTitle(selectedView.title)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            withAnimation {
                                isMenuOpen.toggle()
                            }
                        }) {
                            Image(systemName: "line.3.horizontal")
                                .imageScale(.large)
                        }
                    }
                }
                
                if isMenuOpen {
                    SideMenu(isOpen: $isMenuOpen, selectedView: $selectedView)
                        .transition(.move(edge: .trailing))
                }
            }
        }
    }
}

enum MenuOption: String, CaseIterable {
    case waterNotification, home, profile, settings, viewModifiersOne, scrollableCollectionView

    var title: String {
        switch self {
        case .waterNotification: return "Water Notification"
        case .home: return "Home"
        case .profile: return "Profile"
        case .settings: return "Settings"
        case .viewModifiersOne: return "View Modifiers 1"
        case .scrollableCollectionView: return "Scrollable Collection View"
        }
    }
}

struct SideMenu: View {
    @Binding var isOpen: Bool
    @Binding var selectedView: MenuOption

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(MenuOption.allCases, id: \.self) { option in
                Button(action: {
                    selectedView = option
                    withAnimation {
                        isOpen = false
                    }
                }) {
                    Text(option.title)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                }
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .padding(.top, UIApplication.shared.statusBarFrame.height + 50)
        .background(Color(.systemGray6))
        .edgesIgnoringSafeArea(.all)
    }
}

// Example Views
struct HomeView: View {
    var body: some View {
        Text("🏠 Home View").font(.largeTitle)
    }
}

struct ProfileView: View {
    var body: some View {
        Text("👤 Profile View").font(.largeTitle)
    }
}

struct SettingsView: View {
    var body: some View {
        Text("⚙️ Settings View").font(.largeTitle)
    }
}
