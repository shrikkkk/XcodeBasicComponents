//
//  ContentView.swift
//  MovieCarousel
//
//  Created by Yumin Xia on 2023/10/25.
//

import SwiftUI

struct ContentView: View {
    
    var cardList = [
        Card(id: 0, color: .red, name: "red"),
        Card(id: 1, color: .blue, name: "blue"),
        Card(id: 2, color: .green, name: "green"),
        Card(id: 3, color: .orange, name: "orange"),
        Card(id: 4, color: .black, name: "black")
    ]
    
    var body: some View {
        Spacer()
        VStack {
            TabView() {
                CarouselStyleOne(cards: cardList)
                .tabItem {
                    Label(
                        "Style One",
                        systemImage: "pencil"
                    )
                }
                
                CarouselStyleTwo(cards: cardList)
                .tabItem {
                    Label(
                        "Style Two",
                        systemImage: "pencil"
                    )
                }
            }
        }
        Spacer()
    }
}

#Preview {
    ContentView()
}
