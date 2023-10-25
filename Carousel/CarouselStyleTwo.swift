//
//  CarouselStyleTwo.swift
//  Carousel
//
//  Created by Yumin Xia on 2023/10/25.
//

import SwiftUI

struct CarouselStyleTwo: View {
    
    var cards: [Card]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 16) {
                ForEach(cards, id: \.id) { card in
                    GeometryReader { proxy in
                        let scale = getScale(proxy: proxy)
                            VStack(spacing: 4) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 25)
                                        .fill(card.color)
                                        .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.3),
                                                radius: 10)
                                        .frame(width: 250)
                                    
                                    Text(card.name)
                                        .font(.largeTitle)
                                        .foregroundStyle(.white)
                                        .bold()
                                        .italic()
                                }
                            }
                            .scaleEffect(.init(width: scale, height: scale))
                            .animation(.spring(), value: 1)
                            .padding(.vertical)
                    }
                    .frame(width: 125, height: 400)
                    .padding(.horizontal, 32)
                    .padding(.vertical, 32)
                }
                Spacer()
                    .frame(width: 16)
            }
        }
    }
    
    func getScale(proxy: GeometryProxy) -> CGFloat {
        let midPoint: CGFloat = 125
         
        let viewFrame = proxy.frame(in: CoordinateSpace.global)
         
        var scale: CGFloat = 1.0
        let deltaXAnimationThreshold: CGFloat = 125
         
        let diffFromCenter = abs(midPoint - viewFrame.origin.x - deltaXAnimationThreshold / 2)
        if diffFromCenter < deltaXAnimationThreshold {
            scale = 1 + (deltaXAnimationThreshold - diffFromCenter) / 500
        }
         
        return scale
    }
}
