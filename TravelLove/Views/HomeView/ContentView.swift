//
//  ContentView.swift
//  TravelLove
//
//  Created by Srinivasan Rajendran on 2020-05-01.
//  Copyright © 2020 Srinivasan Rajendran. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    // MARK: Properties
    @State var showAlert = false
    @State var showGuideView = false
    @State var showInfoView = false
    @GestureState private var dragState = DragState.inactive
    @State private var lastCardIndex: Int = 1
    @State private var cardRemovalTransition = AnyTransition.trailingBottom

    private let dragAreaThreshold: CGFloat = 65.0

    // MARK: Drag States

    enum DragState {
        case inactive
        case pressing
        case dragging(translation: CGSize)

        var translation: CGSize {
            switch self {
            case .inactive, .pressing:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }

        var isDragging: Bool {
            switch self {
            case .dragging:
                return true
            case .inactive, .pressing:
                return false
            }
        }

        var isPressing: Bool {
            switch self {
            case .dragging, .pressing:
                return true
            case .inactive:
                return false
            }
        }
    }

    @State var cardViews: [CardView] = {
        var views = [CardView]()
        for index in 0..<2 {
            views.append(CardView(destination: destinations[index]))
        }
        return views
    }()

    // MARK: Move Cards

    private func moveCards() {
        cardViews.removeFirst()
        lastCardIndex += 1
        let destination = destinations[lastCardIndex % destinations.count]
        cardViews.append(CardView(destination: destination))
    }

    private func isTopMostCard(cardView: CardView) -> Bool {
        guard let index = cardViews.firstIndex(where: {
            $0.id == cardView.id
        }) else { return false }
        return index == 0
    }

    var body: some View {
        VStack {

            // MARK: Header View
            HeaderView(showGuideView: $showGuideView, showInfoView: $showInfoView)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default)

            Spacer()

            // MARK: Cards
            ZStack {
                ForEach(cardViews,id: \.self.id) { card in
                    card
                        .zIndex(self.isTopMostCard(cardView: card) ? 1 : 0)
                    .overlay(
                        ZStack {
                        Image(systemName: "x.circle")
                            .modifier(SymbolModifier())
                            .opacity(self.dragState.translation.width < -self.dragAreaThreshold && self.isTopMostCard(cardView: card) ? 1.0 : 0.0)
                        Image(systemName: "heart.circle")
                            .modifier(SymbolModifier())
                            .opacity(self.dragState.translation.width > self.dragAreaThreshold && self.isTopMostCard(cardView: card) ? 1.0 : 0.0)
                        }

                    )
                        .offset(x: self.isTopMostCard(cardView: card) ? self.dragState.translation.width : 0, y: self.isTopMostCard(cardView: card) ? self.dragState.translation.height: 0)
                        .scaleEffect(self.isTopMostCard(cardView: card) ? (self.dragState.isDragging ? 0.80 : 1.0) : 1.0)
                        .rotationEffect(Angle(degrees: self.isTopMostCard(cardView: card) ? Double(self.dragState.translation.width / 12) : 0))
                        .animation(.interpolatingSpring(stiffness: 120, damping: 120))
                        .gesture(LongPressGesture(minimumDuration: 0.01)
                            .sequenced(before: DragGesture())
                            .updating(self.$dragState, body: { (value, state, transaction) in
                                switch value {
                                case .first(true):
                                    state = .pressing
                                case .second(true, let drag):
                                    state = .dragging(translation: drag?.translation ?? .zero)
                                default:
                                    break
                                }
                            })
                            .onChanged( { value in
                                guard case .second(true, let drag?) = value else { return }
                                if drag.translation.width < -self.dragAreaThreshold {
                                    self.cardRemovalTransition = .leadingBottom
                                } else {
                                    self.cardRemovalTransition = .trailingBottom
                                }
                            })
                            .onEnded({ value in
                                guard case .second(true, let drag?) = value else { return }
                                if drag.translation.width < -self.dragAreaThreshold || drag.translation.width > self.dragAreaThreshold {
                                    playSound(sound: "sound-rise", type: "mp3")
                                    self.moveCards()
                                }
                            })
                    )
                        .transition(self.cardRemovalTransition)


                }
            }

            Spacer()

            // MARK: Footer View
            FooterView(showAlert: $showAlert)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default)
        }
        .alert(isPresented: $showAlert) { () -> Alert in
            Alert(title: Text("Success")
                , message: Text("Booking success. Wish you Luck"), dismissButton: .default(Text("Happy Holidays")))
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
