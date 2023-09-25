//
//  SectionTitleView.swift
//  MuscleUP
//
//  Created by Felipe Gadea Llopis on 30/8/23.
//

import SwiftUI

struct SectionTitleView: View {
    var title: String = ""
    var actionTitle: String?
    var action: (() -> Void) = {}
    var body: some View {
        HStack(alignment: .bottom) {
            Text(title)
                .font(.system(size: 17, weight: .heavy, design: .default)).foregroundColor(Color(CustomColors.colors.primaryForeground.rawValue))
            Spacer()
            if let actionTitle = actionTitle {
                Button(action: action) {
                    Text(actionTitle)
                        .font(.system(size: 13, weight: .medium, design: .default))
                        .foregroundColor(Color(CustomColors.colors.primaryAccentColor.rawValue))
                }
            }
        }
    }
}

struct SectionTitleView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            SectionTitleView(title: "Today workout plan", actionTitle: "mon 26 apr")
        }.preferredColorScheme(.dark)
    }
}
