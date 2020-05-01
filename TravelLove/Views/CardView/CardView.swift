//
//  CardView.swift
//  TravelLove
//
//  Created by Srinivasan Rajendran on 2020-05-01.
//  Copyright © 2020 Srinivasan Rajendran. All rights reserved.
//

import SwiftUI

struct CardView: View {

    var id = UUID()
    var destination: Destination

    var body: some View {
        Image(destination.image)
        .resizable()
        .cornerRadius(24)
        .scaledToFit()
        .overlay(
            VStack(alignment: .center, spacing: 12) {
                Text(destination.place.uppercased()).foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .overlay(
                        Rectangle()
                            .fill(Color.white)
                            .frame(height: 1),
                        alignment: .bottom
                )
                Text(destination.country.uppercased()).foregroundColor(.black)
                .font(.footnote)
                .fontWeight(.bold)
                    .frame(minWidth: 85)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                .background(
                    Capsule().fill(Color.white)
                )
            }
            .frame(minWidth: 250)
            .padding(.bottom, 50),
            alignment: .bottom

        )
        .padding()

    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(destination: destinations[0])
    }
}
