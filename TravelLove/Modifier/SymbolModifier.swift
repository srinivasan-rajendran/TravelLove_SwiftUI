//
//  SymbolModifier.swift
//  TravelLove
//
//  Created by Srinivasan Rajendran on 2020-05-01.
//  Copyright © 2020 Srinivasan Rajendran. All rights reserved.
//

import SwiftUI

struct SymbolModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
        .foregroundColor(.red)
        .font(.system(size: 128))
        .shadow(color: Color(UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)), radius: 12, x: 0, y: 0)
    }
}
