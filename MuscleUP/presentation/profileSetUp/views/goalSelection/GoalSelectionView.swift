//
//  HeigthSelectionView.swift
//  MuscleUP
//
//  Created by Felipe Gadea Llopis on 27/8/23.
//

import SwiftUI

struct GoalSelectionView: View {
    @Binding var selection: Int
    var data: [String] = []

    let titleFontStyle = Font.custom("Integral CF", size: 20)
    let subtitleFontStyle = Font.custom("Integral CF", size: 10)
    let buttonFont = Font.custom("Integral CF", size: 15)
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            ForEach(0..<5) { count in
                let value = data[count]
                HStack {
                    Spacer()
                    if selection == count {
                        Text("\(value)").font(Font.custom("Integral CF", size: 26)
                            .weight(.semibold)).padding(.bottom, 11).foregroundColor(Color(CustomColors.colors.secondaryAccentColor.rawValue)).padding(.horizontal, 18).padding(.top, 4).background {
                                RoundedRectangle(cornerRadius: 12).foregroundColor(Color(CustomColors.colors.primaryAccentColor.rawValue))
                            }

                    } else {
                        Button(action: {
                            selection = count
                        }) {
                            Text("\(value)").font(Font.custom("Integral CF", size: 22)
                                .weight(.semibold))
                        }
                    }
                    Spacer()
                }.padding(.vertical, 12)

            }
        }
            .foregroundColor(Color(CustomColors.colors.primaryForeground.rawValue))
            .background(Color(CustomColors.colors.primaryBackground.rawValue))
    }
}

struct GoalSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        GoalSelectionView(selection: .constant(3), data: ["Gain Weigth", "Lose Weigth", "Get Fitter", "Gain More Flexibility", "Learn The Basic"])
    }
}
