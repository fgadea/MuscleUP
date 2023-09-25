//
//  BaseView.swift
//  MuscleUP
//
//  Created by Felipe Gadea Llopis on 29/8/23.
//

import SwiftUI

struct BaseView: View {
    @State var selectedTab = 0

    let tabs: [TabItem] = [
        TabItem(iconName: "home", index: 0),
        TabItem(iconName: "insight", index: 1),
        TabItem(iconName: "notification", index: 2),
        TabItem(iconName: "user", index: 3)
    ]
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                HomeView().tag(0)
                InsigthsView().tag(1)
                Text("Notifications").tag(2)
                Text("profile").tag(3)

            }.tabViewStyle(.page(indexDisplayMode: .never))
                .ignoresSafeArea()

            CustomTabBarView(selectedTab: $selectedTab, items: tabs)
        }
            .navigationBarBackButtonHidden()
            .background(Color(CustomColors.colors.primaryBackground.rawValue))
            .foregroundColor(Color(CustomColors.colors.primaryForeground.rawValue))
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
