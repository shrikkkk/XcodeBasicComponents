//
//  Carousel.swift
//  Carousel
//
//  Created by Yumin Xia on 2023/10/25.
//

import SwiftUI

struct CarouselStyleOne: View {
    
    var cards: [Card]
    
    var body: some View {
        VStack {
            TabView {
               ForEach(cards, id: \.id) { card in
                   ZStack {
                       RoundedRectangle(cornerRadius: 25)
                           .fill(card.color)
                           .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.3),
                                   radius: 10)
                       
                       Text(card.name)
                           .font(.largeTitle)
                           .foregroundStyle(.white)
                           .bold()
                           .italic()
                       
                   }
               }
           }
           .tabViewStyle(.page)
           .indexViewStyle(.page(backgroundDisplayMode: .interactive))
           .cornerRadius(30)
           .padding(10)
        }
    }
    
}
