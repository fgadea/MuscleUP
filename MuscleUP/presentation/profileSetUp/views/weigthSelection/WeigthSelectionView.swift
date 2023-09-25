//
//  WeigthSelectionView.swift
//  MuscleUP
//
//  Created by Felipe Gadea Llopis on 27/8/23.
//

import SwiftUI

struct WeigthSelectionView: View {
    @Binding var selection: Int

    let titleFontStyle = Font.custom("Integral CF", size: 20)
    let subtitleFontStyle = Font.custom("Integral CF", size: 10)
    let buttonFont = Font.custom("Integral CF", size: 15)
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            HStack(alignment: .bottom) {
                Text("\(selection)").font(Font.custom("Integral CF", size: 48)
                    .weight(.semibold)).padding(.leading, 30)
                Text("kg").padding(.bottom, 2)
            }
            ZStack(alignment: .bottom) {
                ScrollViewReader { proxy in
                    ScrollView(.horizontal) {
                        ScrollViewOffsetTracker()
                        LazyHStack(alignment: .bottom, spacing: 12) {
                            ForEach(0..<1000) { value in
                                Rectangle().frame(width: 3, height: 35).id(value)
                            }.onAppear() {
                                withAnimation {
                                    proxy.scrollTo(250)
                                }
                            }
                        }.foregroundColor(Color(uiColor: UIColor(red: 0.40, green: 0.40, blue: 0.40, alpha: 1)))
                            .gesture(DragGesture().onChanged { value in
                            print(value)
                        })
                    }.withOffsetTracking(action: {
                        print("Offset: \($0)")
                        selection = Int($0.x / 50) * -1
                    })
                        .scrollContentBackground(.hidden)
                        .scrollIndicators(.never)
                        .frame(height: 100)
                        .onAppear() {
                        withAnimation {
                            proxy.scrollTo(selection, anchor: .center)
                        }
                    }.padding(.bottom, 20)
                }

                HStack(spacing: 20) {
                    Rectangle().foregroundColor(Color(CustomColors.colors.primaryAccentColor.rawValue)).frame(width: 5, height: 80)
                    Rectangle().foregroundColor(Color(CustomColors.colors.primaryAccentColor.rawValue)).frame(width: 5, height: 80)
                }
            }
        }
            
            .foregroundColor(Color(CustomColors.colors.primaryForeground.rawValue))
            .background(Color(CustomColors.colors.primaryBackground.rawValue))
    }
}

struct WeigthSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        WeigthSelectionView(selection: .constant(70))
    }
}

enum ScrollOffsetNamespace {

    static let namespace = "scrollView"
}

struct ScrollOffsetPreferenceKey: PreferenceKey {

    static var defaultValue: CGPoint = .zero

    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) { }
}

private extension ScrollView {

    func withOffsetTracking(
        action: @escaping (_ offset: CGPoint) -> Void
    ) -> some View {
        self.coordinateSpace(name: ScrollOffsetNamespace.namespace)
            .onPreferenceChange(ScrollOffsetPreferenceKey.self, perform: action)
    }
}

struct ScrollViewOffsetTracker: View {

    var body: some View {
        GeometryReader { geo in
            Color.clear
                .preference(
                key: ScrollOffsetPreferenceKey.self,
                value: geo.frame(in: .named(ScrollOffsetNamespace.namespace)).origin
            )
        }
            .frame(height: 0)
    }
}

