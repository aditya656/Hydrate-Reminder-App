//
//  ViewModifiers1.swift
//  LocalNotification
//
//  Created by Aditya Patole on 30/05/25.
//

import SwiftUI

struct ViewModifiersOne: View {
    @State var haptic: Bool = false
    
    var body: some View {
//        Rectangle()
//            .containerRelativeFrame(.vertical) { value, _ in
//                return value * 0.3
//            }
        
        
//        NavigationStack {
//            if #available(iOS 18.0, *) {
//                Text("Home")
//                    .navigationTitle("Hello")
//                    .containerBackground(.clear, for: .navigation)
//            } else {
//                // Fallback on earlier versions
//            }
//        }
//        .background(.red)
        
        
        Button("Trigger haptic feedback") {
            haptic.toggle()
        }
        .sensoryFeedback(.warning, trigger: haptic)
    }
}

#Preview {
    ViewModifiersOne()
}
