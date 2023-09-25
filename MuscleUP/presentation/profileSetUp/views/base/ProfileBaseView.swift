//
//  ProfileBaseView.swift
//  MuscleUP
//
//  Created by Felipe Gadea Llopis on 28/8/23.
//

import SwiftUI

struct ProfileBaseView<Content: View>: View {
    var title: String = ""
    var subtitle: String = ""
    @ViewBuilder let content: Content
    
    let titleFontStyle = Font.custom("Integral CF", size: 20)
    let subtitleFontStyle = Font.custom("Integral CF", size: 10)
    let buttonFont = Font.custom("Integral CF", size: 15)
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text(title).font(titleFontStyle).fontWeight(.bold)
                .padding(.horizontal, 34).padding(.top, 45).multilineTextAlignment(.center)
            Text(subtitle).font(subtitleFontStyle).padding(.horizontal, 32).padding(.vertical, 12).multilineTextAlignment(.center)
            Spacer()
            content
            Spacer()
        }
            .navigationBarBackButtonHidden()
            .foregroundColor(Color(CustomColors.colors.primaryForeground.rawValue))
            .background(Color(CustomColors.colors.primaryBackground.rawValue))
    }
}

struct ProfileBaseView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileBaseView(title: "Tell us about yourself!", subtitle: "To give you a better experience we need to know your gender") {
            Text("dd")
        }
    }
}
