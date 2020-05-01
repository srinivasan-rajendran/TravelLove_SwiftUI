//
//  InfoView.swift
//  TravelLove
//
//  Created by Srinivasan Rajendran on 2020-05-01.
//  Copyright © 2020 Srinivasan Rajendran. All rights reserved.
//

import SwiftUI

struct InfoView: View {

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
        VStack(alignment: .center, spacing: 20 ) {
            HeaderComponent()
            Spacer(minLength: 10)
            Text("App Info")
                .fontWeight(.black)
            .modifier(TitleModifier())

            AppInfoView()
            Text("Credits")
                .fontWeight(.black)
            .modifier(TitleModifier())
            CreditsView()
            Spacer(minLength: 10)
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

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}

struct AppInfoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            RowAppInfoView(item1: "Application", item2: "Honeymoon")
            RowAppInfoView(item1: "Compatibility", item2: "iPhone")
            RowAppInfoView(item1: "Developer", item2: "Srinivasan Rajendran")
            RowAppInfoView(item1: "Version", item2: "1.0.0")
        }
    }
}

struct RowAppInfoView: View {

    var item1: String
    var item2: String

    var body: some View {
        VStack {
            HStack {
                Text(item1).foregroundColor(.gray)
                Spacer()
                Text(item2)
            }
            Divider()
        }

    }
}

struct CreditsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Photos").foregroundColor(.gray)
                Spacer()
                Text("Unsplash")
            }
            Divider()
            Text("Photographers").foregroundColor(.gray)
            Text("Shifaaz Shamoon (Maldives), Grillot Edouard (France), Evan Wise (Greece), Christoph Schulz (United Arab Emirates), Andrew Coelho (USA), Damiano Baschiera (Italy), Daniel Olah (Hungary), Andrzej Rusinowski (Poland), Lucas Miguel (Slovenia), Florencia Potter (Spain), Ian Simmonds (USA), Ian Keefe (Canada), Denys Nevozhai (Thailand), David Köhler (Italy), Andre Benz (USA), Alexandre Chambon (South Korea), Roberto Nickson (Mexico), Ajit Paul Abraham (UK), Jeremy Bishop (USA), Davi Costa (Brazil), Liam Pozz (Australia)")
                .multilineTextAlignment(.leading)
                .font(.footnote)
        }

    }
}
