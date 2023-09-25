//
//  OldSelectionView.swift
//  MuscleUP
//
//  Created by Felipe Gadea Llopis on 27/8/23.
//

import SwiftUI

struct OldSelectionView: View {
    @Binding var selection: Int

    let titleFontStyle = Font.custom("Integral CF", size: 20)
    let subtitleFontStyle = Font.custom("Integral CF", size: 10)
    let buttonFont = Font.custom("Integral CF", size: 15)
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            ScrollViewReader { proxy in
                List {
                    ForEach(12..<100) { value in
                        HStack {
                            Spacer()
                            if selection == value {

                                HStack {
                                    Text("\(value)").font(Font.custom("Integral CF", size: 48)
                                        .weight(.semibold)).padding(.bottom, 11)
                                    Text("years")
                                }.foregroundColor(Color(CustomColors.colors.secondaryAccentColor.rawValue)).padding(.horizontal, 12).padding(.vertical, 8).background {
                                    RoundedRectangle(cornerRadius: 18).foregroundColor(Color(CustomColors.colors.primaryAccentColor.rawValue))
                                }

                            } else {
                                Button(action: {
                                    selection = value
                                }) {
                                    Text("\(value)").font(Font.custom("Integral CF", size: 36)
                                        .weight(.semibold))
                                }
                            }
                            Spacer()
                        }.id(value)

                    }.listRowBackground(Color(CustomColors.colors.primaryBackground.rawValue))

                }
                    .scrollContentBackground(.hidden)
                    .scrollIndicators(.never)
                    .onAppear() {
                    withAnimation {
                        proxy.scrollTo(selection, anchor: .center)
                    }
                }
            }
        }
            .foregroundColor(Color(CustomColors.colors.primaryForeground.rawValue))
            .background(Color(CustomColors.colors.primaryBackground.rawValue))
    }
}

struct OldSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        OldSelectionView(selection: .constant(30))
    }
}
