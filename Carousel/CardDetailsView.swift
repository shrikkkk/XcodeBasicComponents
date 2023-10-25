//
//  CardDetailsView..swift
//  CardDetailsView
//
//  Created by Yumin Xia on 2023/10/25.
//

import SwiftUI

struct CardDetailsView: View {
    let cardData: Card
         
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.black)
            .frame(width: 250, height: 350)
            .shadow(color: Color(.sRGBLinear, white: 1, opacity: 0.3),
                radius: 25)
    }
}
