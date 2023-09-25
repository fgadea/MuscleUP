//
//  ProfileSetUpView.swift
//  MuscleUP
//
//  Created by Felipe Gadea Llopis on 27/8/23.
//

import SwiftUI

struct ProfileSetUpView: View {
    @EnvironmentObject var router: Router
    @State var genderSelection = -1
    @State var oldSelection = 28
    @State var weigthSelection = 67
    @State var heigthSelection = 169
    @State var goalSelection = -1
    @State var activitySelection = -1
    @State private var tabSelection = 1

    var body: some View {
        VStack {
            TabView(selection: $tabSelection) {
                ProfileBaseView(title: "Tell us about yourself!", subtitle: "To give you a better experience we need to know your gender") {
                    GenderSelectionView(selection: $genderSelection)
                }.tag(1)
                ProfileBaseView(title: "How old are you?", subtitle: "This helps us create your personalized plan") {
                    OldSelectionView(selection: $oldSelection)
                }.tag(2)
                ProfileBaseView(title: "What’s your weight?", subtitle: "You can always change this later") {
                    WeigthSelectionView(selection: $weigthSelection)
                }.tag(3)
                ProfileBaseView(title: "What’s your height?", subtitle: "This helps us create your personalized plan") {
                    HeigthSelectionView(selection: $heigthSelection)
                }.tag(4)
                ProfileBaseView(title: "What’s your goal?", subtitle: "This helps us create your personalized plan") {
                    GoalSelectionView(selection: $goalSelection, data: ["Gain Weigth", "Lose Weigth", "Get Fitter", "Gain More Flexibility", "Learn The Basic"])
                }.tag(5)
                ProfileBaseView(title: "Your regular physical activity level?", subtitle: "This helps us create your personalized plan") {
                    ActivitySelectionView(selection: $activitySelection, data: ["Rookie", "Beginner", "Intermediate", "Advance", "True beast"])
                }.tag(6)
            }
                .tabViewStyle(.page(indexDisplayMode: .never))

            HStack {
                if tabSelection != 1 {
                    Button(action: { withAnimation { tabSelection -= 1 } }) {
                        VStack {
                            Image(systemName: "arrow.backward")
                        }
                            .frame(width: 60, height: 60)
                            .foregroundColor(Color.white)
                            .background(Color(CustomColors.colors.secondaryAccentColor.rawValue))
                            .clipShape(Circle()).padding(.leading, 32)
                    }
                }
                Spacer()
                if tabSelection == 6 {
                    CustomButton(title: "Finish") {
                        withAnimation {
                            router.navigate(to: .home)
                        }
                    }.padding(.trailing, 32)
                } else {
                    CustomButton(title: "Next") {
                        withAnimation {
                            tabSelection += 1
                        }
                    }.padding(.trailing, 32)
                }
            }
        }
            .navigationBarBackButtonHidden()
            .background(Color(CustomColors.colors.primaryBackground.rawValue))
    }

}

struct ProfileSetUpView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSetUpView()
    }
}
