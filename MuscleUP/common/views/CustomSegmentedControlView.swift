//
//  CustomSegmentedControlView.swift
//  MuscleUP
//
//  Created by Felipe Gadea Llopis on 30/8/23.
//

import SwiftUI

struct CustomSegmentedControlView: View {
    @Binding var selection: Int
    var segments: [Segment]
    var segmentColor = Color(CustomColors.colors.primaryAccentColor.rawValue)

    var body: some View {
        GeometryReader { reader in
            let segmentWidth = (reader.size.width / CGFloat(segments.count))
            let segmentPosition = (((Int(reader.size.width) / segments.count)) * (selection))
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 24)
                    .fill(segmentColor)
                    .frame(width: segmentWidth, height: 30)

                    .offset(CGSize(width: segmentPosition, height: 0))
                HStack {
                    ForEach(segments) { value in
                        Button(action: {
                            withAnimation { selection = value.id } }) {
                            HStack {
                                Spacer()
                                Text(value.text)
                                Spacer()
                            }.padding(.vertical, 6).padding(.horizontal, 6)
                        }.foregroundColor(selection == value.id ? .black : .white).tag(value.id)
                            .buttonStyle(BorderlessButtonStyle())
                    }
                }.font(.system(size: 14, weight: .medium, design: .default))
            }
                .background(Color(CustomColors.colors.secondaryAccentColor.rawValue)).cornerRadius(24)
        }
            .frame(height: 30).padding(.vertical, 12)

    }
}

struct CustomSegmentedControlView_Previews: PreviewProvider {
    static var previews: some View {
        let segments = [
            Segment(id: 0, text: "Beginner"), Segment(id: 1, text: "Internediate"), Segment(id: 2, text: "Advance")
        ]
        CustomSegmentedControlView(selection: .constant(1), segments: segments).preferredColorScheme(.dark)
    }
}
