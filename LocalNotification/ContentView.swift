//
//  ContentView.swift
//  LocalNotification
//
//  Created by Aditya Patole on 14/01/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    
    var body: some View {
        VStack {
            HStack {
                Text("Interval: \(viewModel.sliderValue) min")
                    .font(.title2)
                Spacer()
                Text("for: \(viewModel.count) times")
                    .font(.title2)
            }
            .padding(.horizontal, 24)
            
            HStack {
                Picker("Select Count", selection: $viewModel.sliderValue) {
                    ForEach(Array(stride(from: 20, through: 60, by: 5)), id: \.self) { num in
                        Text("\(num)").tag(num)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(height: 150)
                
                Picker("Select Count", selection: $viewModel.count) {
                    ForEach(1...30, id: \.self) { num in
                        Text("\(num)").tag(num)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(height: 150)
            }
            
            Button(action: {
                viewModel.scheduleNotification()
            }, label: {
                Text("Notify")
            })
            .foregroundStyle(Color.white)
            .padding(.horizontal, 25)
            .padding(.vertical, 10)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 6))
            .padding(.top, 24)
            .alert("Alert", isPresented: $viewModel.showAlert) {
                Button("OK", role: .cancel) {}
            } message: {
                Text("\(viewModel.alertText)")
            }
            Button(action: {
                viewModel.removeAllExistingNotifications()
            }, label: {
                Text("Remove All")
            })
            .foregroundStyle(Color.white)
            .padding(.horizontal, 25)
            .padding(.vertical, 10)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 6))
            .padding(.top, 24)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
