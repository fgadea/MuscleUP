//
//  GenderSelectionView.swift
//  MuscleUP
//
//  Created by Felipe Gadea Llopis on 27/8/23.
//

import SwiftUI

struct GenderSelectionView: View {
    @Binding var selection: Int
    let titleFontStyle = Font.custom("Integral CF", size: 20)
    let subtitleFontStyle = Font.custom("Integral CF", size: 10)
    let buttonFont = Font.custom("Integral CF", size: 15)
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Button(action: { withAnimation{ selection = 0 } }) {
                VStack {
                    Image(selection == 0 ? "maleSelected" : "maleUnselected").padding(.leading, 10)
                    Text("male").font(buttonFont).padding(.top, 10)
                }
                    .frame(width: 140, height: 140)
                    .foregroundColor(selection == 0 ? Color.black : Color.white)
                    .background(Color(selection == 0 ? CustomColors.colors.primaryAccentColor.rawValue : CustomColors.colors.secondaryAccentColor.rawValue))
                    .clipShape(Circle())
            }
            Rectangle().fill(Color.clear).frame(height: 40)
            Button(action: { withAnimation { selection = 1 }}) {
                VStack {
                    Image(selection == 1 ? "femaleSelected" : "femaleUnselected")
                    Text("female").font(buttonFont).padding(.top, 10)
                }
                    .frame(width: 140, height: 140)
                    .foregroundColor(selection == 1 ? Color.black : Color.white)
                    .background(Color(selection == 1 ? CustomColors.colors.primaryAccentColor.rawValue : CustomColors.colors.secondaryAccentColor.rawValue))
                    .clipShape(Circle())
            }
            
        }
            .foregroundColor(Color(CustomColors.colors.primaryForeground.rawValue))
            .background(Color(CustomColors.colors.primaryBackground.rawValue))
    }
}

struct GenderSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileBaseView() {
            GenderSelectionView(selection: .constant(1))
        }
    }
}
