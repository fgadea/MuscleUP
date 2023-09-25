//
//  CustomButton.swift
//  MuscleUP
//
//  Created by Felipe Gadea Llopis on 27/8/23.
//

import SwiftUI

struct CustomButton: View {
    @State var title = ""
    var action: () -> Void = {}
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(Font.custom("Integral CF", size: 20))
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 12, trailing: 20))
        }
            .buttonBorderShape(.capsule)
            .buttonStyle(.borderedProminent)
            .tint(Color(CustomColors.colors.primaryAccentColor.rawValue))
            .foregroundColor(.black)
    }
}
