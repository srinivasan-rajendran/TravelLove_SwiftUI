//
//  GuideView.swift
//  TravelLove
//
//  Created by Srinivasan Rajendran on 2020-05-01.
//  Copyright © 2020 Srinivasan Rajendran. All rights reserved.
//

import SwiftUI

struct GuideView: View {

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                HeaderComponent()
                Spacer(minLength: 10)
                Text("Get Started!")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
            }
            Spacer(minLength: 10)
            Text("Discover and pick the perfect destination for your romantic Honeymoon!")
            .lineLimit(nil)
                .multilineTextAlignment(.center)

            Spacer(minLength: 10)

            VStack(alignment: .leading, spacing: 25) {
                GuideComponent(title: "Like", subtitle: "Swipe Right", description: "Do you like this destination? Touch the screen and swipe right. It will be saved to the favourites.", icon: "heart.circle")
                GuideComponent(title: "Dismiss", subtitle: "Swipe Left", description: "Would you rather skip this place? Touch the screen and swipe left. You will no longer see it.", icon: "xmark.circle")
                GuideComponent(title: "Book", subtitle: "Tap the Button", description: "Our selection of honeymoon resorts is the perfect setting for you to embark you new life together", icon: "checkmark.square")
                Spacer(minLength: 20)
                Button(action: { self.presentationMode.wrappedValue.dismiss() }) {
                    Text("Continue".uppercased())
                    .modifier(ButtonModifier())

                }
            }

            .padding(.top, 15)
            .padding(.bottom, 25)
            .padding(.horizontal, 25)

        }
    }
}

struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        GuideView()
    }
}
