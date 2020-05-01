//
//  FooterView.swift
//  TravelLove
//
//  Created by Srinivasan Rajendran on 2020-05-01.
//  Copyright © 2020 Srinivasan Rajendran. All rights reserved.
//

import SwiftUI

struct FooterView: View {

    @Binding var showAlert: Bool
    let haptics = UINotificationFeedbackGenerator()

    var body: some View {
        HStack {
            Button(action: {}) {
                Image(systemName: "xmark.circle")
            }
            .font(.system(size: 42, weight: .light))
            .accentColor(Color.primary)
            Spacer()
            Button(action: {
                playSound(sound: "sound-click", type: "mp3")
                self.haptics.notificationOccurred(.success)
                self.showAlert.toggle()
            }) {
                Text("Book Destination".uppercased())
                    .font(.system(.subheadline, design: .rounded))
                    .fontWeight(.bold)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .accentColor(Color.pink)
                .background(
                    Capsule().stroke(Color.pink, lineWidth: 2)
                )
            }
            Spacer()
            Button(action: {}) {
                Image(systemName: "heart.circle")
            }
            .font(.system(size: 42, weight: .light))
            .accentColor(Color.primary)
        }
    .padding()
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView(showAlert: .constant(false)).previewLayout(.fixed(width: 375, height: 80))
    }
}
