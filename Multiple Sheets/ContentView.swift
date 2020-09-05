//
//  ContentView.swift
//  Multiple Sheets
//
//  Created by Stewart Lynch on 2020-09-03.
//

import SwiftUI

struct ContentView: View {
    enum Target:Int, Identifiable  {
        var id: Int {
            rawValue
        }
        case red, green, yellow
    }
    @State private var selectedTarget:Target? = nil
    
    var body: some View {
        VStack(spacing: 25) {
            Button("Red View") {
                selectedTarget = .red
            }.buttonStyle(CustomButton(bgColor: .red))
            
            Button("Green View") {
                selectedTarget = .green
            }.buttonStyle(CustomButton(bgColor: .green))
            
            Button("Yellow View") {
                selectedTarget = .yellow
            }.buttonStyle(CustomButton(bgColor: .yellow, fgColor: .red))
        }
        .sheet(item: $selectedTarget) { (selectedTarget) in
            switch selectedTarget {
            case .red:
                Color.red
                    .ignoresSafeArea()
            case .green:
                Color.green
                    .ignoresSafeArea()
            case .yellow:
                Color.yellow
                    .ignoresSafeArea()
            }
        }
    }
}

struct CustomButton: ButtonStyle {
    var bgColor: Color
    var fgColor: Color = .white
    var width: CGFloat = 150
    func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label
                .padding(20)
                .background(
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(bgColor)
                            .frame(width: width)
            )
                
                .scaleEffect(configuration.isPressed ? 0.95: 1)
                .foregroundColor(fgColor)
                .animation(.spring())
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
