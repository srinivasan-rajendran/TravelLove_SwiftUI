//
//  ButtonModifier.swift
//  TravelLove
//
//  Created by Srinivasan Rajendran on 2020-05-01.
//  Copyright © 2020 Srinivasan Rajendran. All rights reserved.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Capsule().fill(Color.red))
            .foregroundColor(Color.white)
    }
}
