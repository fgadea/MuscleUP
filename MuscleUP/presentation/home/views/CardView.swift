//
//  CardView.swift
//  MuscleUP
//
//  Created by Felipe Gadea Llopis on 30/8/23.
//

import SwiftUI

struct CardView: View {
    var imageName: String = ""
    var title: String = ""
    var subtitle: String = ""
    var action: () -> Void = {}
    var body: some View {
        Button(action: action) {
            ZStack {
                Image(imageName)
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 160)
                    .cornerRadius(16)
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading, spacing: 4) {
                        Spacer()
                        Text(title)
                            .font(.system(size: 17, weight: .heavy, design: .default)).foregroundColor(.white)
                        Text("| " + subtitle)
                            .font(.system(size: 13, weight: .medium, design: .default))
                            .foregroundColor(Color(CustomColors.colors.primaryAccentColor.rawValue))
                    }
                    Spacer()
                }.padding(.all, 16)
            }
        }.padding(.vertical, 14)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(0..<7) { value in
                    CardView(imageName: "onboarding1", title: "Day 01 - Warm Up", subtitle: "07:00 - 08:00 AM")
                }
            }
        }.preferredColorScheme(.dark)
    }
}
