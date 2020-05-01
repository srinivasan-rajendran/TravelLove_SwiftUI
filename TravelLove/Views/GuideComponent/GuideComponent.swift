//
//  GuideComponent.swift
//  TravelLove
//
//  Created by Srinivasan Rajendran on 2020-05-01.
//  Copyright © 2020 Srinivasan Rajendran. All rights reserved.
//

import SwiftUI

struct GuideComponent: View {

    var title: String
    var subtitle: String
    var description: String
    var icon: String

    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Image(systemName: icon)
                .font(.system(size: 32))
                .foregroundColor(.red)
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text(title.uppercased())
                        .font(.title)
                        .fontWeight(.heavy)
                    Spacer()
                    Text(subtitle.uppercased())
                        .font(.footnote)
                        .fontWeight(.heavy)
                    .foregroundColor(.red)
                }
                Divider().padding(.bottom, 2).background(Color.white)
                Text(description)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                .fixedSize(horizontal: false, vertical: true)
            }
        }
    .padding()
    }
}

struct GuideComponent_Previews: PreviewProvider {
    static var previews: some View {
        GuideComponent(title: "title", subtitle: "subtitle", description: "description description description description description description description description ", icon: "heart.circle").previewLayout(.fixed(width: 370, height: 150))
    }
}
