//
//  HomeView.swift
//  MuscleUP
//
//  Created by Felipe Gadea Llopis on 28/8/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeViewModel = HomeViewModel()

    init() {
        UISegmentedControl.appearance().backgroundColor = UIColor(named: CustomColors.colors.secondaryAccentColor.rawValue)
        UISegmentedControl.appearance().setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(named: CustomColors.colors.primaryAccentColor.rawValue)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)



    }
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(homeViewModel.mainTitle + " ").font(homeViewModel.viewGenericConfiguration.titleStyle)
                    Text(homeViewModel.userName + ",").font(homeViewModel.viewGenericConfiguration.titleStyle.bold())
                    Spacer()
                }
                Text(homeViewModel.mainDescription).font(homeViewModel.viewGenericConfiguration.subtitleStyle)
            }.padding(24)

            List {

                VStack(spacing: 0) {
                    SectionTitleView(title: homeViewModel.todaySection.title, actionTitle: homeViewModel.todaySection.actionTitle)
                    if !homeViewModel.todaySection.content.isEmpty, let content = homeViewModel.todaySection.content.first {
                        CardView(imageName: content.imageName, title: content.title, subtitle: content.subtitle) {
                            print("click")
                        }
                    }
                }.padding(.horizontal, 24)
                    .listRowBackground(Color.clear)
                    .listRowInsets(EdgeInsets())



                CustomSegmentedControlView(selection: $homeViewModel.segmentSelection, segments: homeViewModel.viewGenericConfiguration.segments).padding(.horizontal, 24)
                    .listRowBackground(Color.clear)
                    .listRowInsets(EdgeInsets())

                VStack(spacing: 0) {
                    SectionTitleView(title: homeViewModel.workoutSection.title, actionTitle: homeViewModel.workoutSection.actionTitle)
                        .padding(.horizontal, 24)

                    ScrollView(.horizontal) {
                        LazyHStack {
                            ForEach(homeViewModel.getWorkoutSections()) { content in
                                CardView(imageName: content.imageName, title: content.title, subtitle: content.subtitle) {
                                    print("click")
                                }.frame(width: 300)
                            }
                        }.padding(.horizontal, 24)
                    }


                }
                    .listRowBackground(Color.clear)
                    .listRowInsets(EdgeInsets())


                VStack(spacing: 0) {
                    SectionTitleView(title: homeViewModel.newSection.title, actionTitle: homeViewModel.newSection.actionTitle)
                    if !homeViewModel.newSection.content.isEmpty, let content = homeViewModel.newSection.content.first {
                        CardView(imageName: content.imageName, title: content.title, subtitle: content.subtitle) {
                            print("click")
                        }
                    }
                }.padding(.horizontal, 24).padding(.bottom, 76)
                    .listRowBackground(Color.clear)
                    .listRowInsets(EdgeInsets())

            }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
                .background(.clear)

        }
            .background(Color(CustomColors.colors.primaryBackground.rawValue))
            .foregroundColor(Color(CustomColors.colors.primaryForeground.rawValue))

    }

//
//    func setFrame(index: Int, frame: CGRect) {
//        self.frames[index] = frame
//    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
