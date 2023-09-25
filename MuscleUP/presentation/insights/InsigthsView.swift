//
//  Insigths.swift
//  MuscleUP
//
//  Created by Felipe Gadea Llopis on 30/8/23.
//

import SwiftUI

struct InsigthsView: View {
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Button(action: { }) {
                        Image(systemName: "arrow.backward").padding(.all, 6)
                    }.background(Circle().fill(Color("secondaryBackground"))).buttonStyle(.plain)
                    Spacer()
                    Text("October 2021").font(.system(.title2, design: .default, weight: .bold))
                    Spacer()
                    Button(action: { }) {
                        Image(systemName: "arrow.right").padding(.all, 6)
                    }.background(Circle().fill(Color("secondaryBackground"))).buttonStyle(.plain)
                }.padding(.horizontal, 24).padding(.bottom, 18).padding(.top, 8)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 14) {
                        ForEach(0..<10) { value in
                            if value == 3 {
                            Button(action: { }) {
                                VStack(spacing: 5) {
                                    Text("W")
                                    Text("18")
                                }.padding(.horizontal, 13).padding(.vertical, 13)
                            }.background(RoundedRectangle(cornerRadius: 24).fill(Color(CustomColors.colors.primaryAccentColor.rawValue))).buttonStyle(.plain)
                                .foregroundColor(.black)
                            } else {
                                
                                Button(action: { }) {
                                    VStack(spacing: 5) {
                                        Text("W")
                                        Text("18")
                                    }.padding(.horizontal, 13).padding(.vertical, 13)
                                }.background(RoundedRectangle(cornerRadius: 24).fill(Color("secondaryBackground"))).buttonStyle(.plain)
                                    .foregroundColor(.white)
                            }
                        }
                    }.padding(.leading, 24)
                }.padding(.bottom, 32)
            }.background(
                RoundedRectangle(cornerRadius: 30).fill(Color(CustomColors.colors.secondaryAccentColor.rawValue)).ignoresSafeArea()
            )
            ScrollView {
                Text("Scroll")
            }
        }.background(
            RoundedRectangle(cornerRadius: 30).fill(Color(CustomColors.colors.primaryBackground.rawValue))
        )
    }
}

struct InsigthsView_Previews: PreviewProvider {
    static var previews: some View {
        InsigthsView().preferredColorScheme(.dark)
    }
}
