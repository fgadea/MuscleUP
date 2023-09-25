//
//  CustomTabBarView.swift
//  MuscleUP
//
//  Created by Felipe Gadea Llopis on 29/8/23.
//

import SwiftUI

struct TabItem: Identifiable {
    let id = UUID()
    var iconName: String
    var index: Int
}
struct CustomTabBarView: View {
    @Binding var selectedTab: Int
    @State var items: [TabItem]
    var backgroundColor: Color = Color(CustomColors.colors.secondaryAccentColor.rawValue)
    var focusColor: Color = Color(CustomColors.colors.primaryAccentColor.rawValue)
    var iconFocusColor: Color = .black
    var iconColor: Color = .gray
    
    var body: some View {
        HStack {
            ForEach(items) { item in
                Button {
                    selectedTab = item.index
                } label: {
                    CustomTabItem(imageName: item.iconName, isActive: (selectedTab == item.index))
                }
            }
        }
            .padding(6)
            .frame(height: 70)
            .background(backgroundColor)
            .cornerRadius(35)
            .padding(.horizontal, 26)
    }
    
    func CustomTabItem(imageName: String, isActive: Bool) -> some View {
        HStack {
            Spacer()
            Image(imageName)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(isActive ? iconFocusColor : iconColor)
                .frame(width: 20, height: 20)
            Spacer()
        }
            .frame(height: 60)
            .background(isActive ? focusColor : .clear)
            .cornerRadius(30)
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        let tabs: [TabItem] = [
            TabItem(iconName: "home", index: 1),
            TabItem(iconName: "insight", index: 2),
            TabItem(iconName: "notification", index: 3),
            TabItem(iconName: "user", index: 4)
        ]
        CustomTabBarView(selectedTab: .constant(1), items: tabs).preferredColorScheme(.dark)
    }
}
