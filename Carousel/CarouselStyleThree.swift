//
//  CarouselStyleThree.swift
//  Carousel
//
//  Created by Yumin Xia on 2023/10/26.
//

import SwiftUI

struct CarouselStyleThree: View {
    var cards: [Card]
    
    var xDistance: Int = 40
    
    @State private var snappedItem: Double = Double(0.0)
    @State private var draggingItem: Double = Double(1)
    //current index
    @State private var activeIndex: Int = 0
    
    var body: some View {
        ZStack {
            ForEach(cards, id: \.id) { card in
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(card.color)
                        .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.3),
                                radius: 10)
                        .frame(width: 220, height: 320)
                    
                    Text(card.name)
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .bold()
                        .italic()
                }
                .scaleEffect(1.0 - abs(distance(card.id + 1)) * 0.1)
                .opacity(1.0 - abs(distance(card.id + 1)) * 0.3)
                .offset(x: getOffset(card.id + 1), y: 0)
                .zIndex(1.0 - abs(distance(card.id + 1)) * 0.1)
            }
        }
        .gesture(
            DragGesture()
                .onChanged { value in
                    draggingItem = snappedItem + value.translation.width / 100
                }
                .onEnded { value in
                    withAnimation {
                        draggingItem = snappedItem + value.predictedEndTranslation.width / 100
                        draggingItem = round(draggingItem).remainder(dividingBy: Double(cards.count))
                        snappedItem = draggingItem
                        self.activeIndex = cards.count + Int(draggingItem)
                        if self.activeIndex > cards.count || Int(draggingItem) >= 0 {
                            self.activeIndex = Int(draggingItem)
                        }
                    }
                }
        )
        
    }
    
    func distance(_ item: Int) -> Double {
        return (draggingItem - Double(item).remainder(dividingBy: Double(cards.count)))
    }
    
    func getOffset(_ item: Int) -> Double {
        let angle = Double.pi * 2 / Double(cards.count) * distance(item)
        return sin(angle) * Double(xDistance)
    }
    
}
