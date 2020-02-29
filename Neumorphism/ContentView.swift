//
//  ContentView.swift
//  Neumorphism
//
//  Created by Frank Bara on 2/27/20.
//  Copyright © 2020 BaraLabs. All rights reserved.
//

import SwiftUI

extension Color {
    // Slightly off white
    static let offWhite = Color(red: 225/255, green: 225/255, blue: 235/255)
}

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

struct SimpleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
        .padding(30)
        .contentShape(Circle())
            .background(
                Group {
                    if configuration.isPressed {
                        Circle()
                            .fill(Color.offWhite)
                            .overlay(
                                Circle()
                                    .stroke(Color.gray, lineWidth: 4)
                                .blur(radius: 4)
                                .offset(x: 2, y: 2)
                                    .mask(Circle().fill(LinearGradient(Color.black, Color.clear)))
                            )
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 8)
                            .blur(radius: 4)
                            .offset(x: -2, y: -2)
                                .mask(Circle().fill(LinearGradient(Color.clear, Color.black)))
                        )
                    } else {
                        Circle()
                            .fill(Color.offWhite)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                    }
                }
        )
    }
}

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.offWhite
            
//            RoundedRectangle(cornerRadius: 25)
//                .fill(Color.offWhite)
//                .frame(width: 300, height: 300)
//                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
//                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
            
            Button(action: {
                print("button tapped")
            }) {
                Image(systemName: "heart.fill")
                    .foregroundColor(.gray)
                
            }
        .buttonStyle(SimpleButtonStyle())
            
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
