//
//  Onboarding.swift
//  MuscleUP
//
//  Created by Felipe Gadea Llopis on 27/8/23.
//

import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject var router: Router
    var body: some View {
        TabView {
            OnboardingViewContent(imageName: "onboarding1", l1Text: "Meet your coach,", l2Text: "start your journey")
            OnboardingViewContent(imageName: "onboarding2", l1Text: "Create a workout plan", l2Text: "to stay fit")
            OnboardingViewContent(imageName: "onboarding3", l1Text: "Action is the", l2Text: "key to all success", last: true) {
                router.navigate(to: .profilesetup)
            }
        }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .ignoresSafeArea(edges: .top)
            .background(Color(CustomColors.colors.primaryBackground.rawValue))
    }
}

struct OnboardingViewContent: View {
    var imageName = ""
    var l1Text = ""
    var l2Text = ""
    var last = false
    var action: () -> Void = {}

    var body: some View {
        ZStack (alignment: .bottom) {
            OnboardingBackgroundGradient(imageName: imageName)
            OnboardingContent(l1Text: l1Text, l2Text: l2Text, last: last, action: action)
        }
    }
}

struct OnboardingBackground: View {
    var imageName = ""
    var body: some View {
        GeometryReader { geometry in
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(alignment: .center)
                .clipped()

        }
    }
}

struct OnboardingBackgroundGradient: View {
    var imageName = ""
    var body: some View {
        LinearGradient(colors: [.black.opacity(0.60), .black.opacity(0)], startPoint: UnitPoint(x: 0.5, y: 0), endPoint: UnitPoint(x: 0.5, y: 1.75))
            .background(content: { OnboardingBackground(imageName: imageName) })
            .ignoresSafeArea()
    }
}

struct OnboardingContent: View {
    var l1Text = ""
    var l2Text = ""
    var last = false
    var action: () -> Void

    let fontStyle = Font.custom("Integral CF", size: 24)

    var body: some View {
        GeometryReader { geometry in
            VStack (spacing: 0) {
                Spacer()
                OnboardingContentTriangle()
                    .fill(Color((CustomColors.colors.primaryBackground.rawValue)))
                    .frame(height: 100)
                ZStack (alignment: .top) {
                    Rectangle()
                        .fill(Color((CustomColors.colors.primaryBackground.rawValue)))
                        .ignoresSafeArea()
                    VStack {
                        Text(l1Text)
                            .font(fontStyle)
                        Text(l2Text)
                            .font(fontStyle).fontWeight(.bold)
                        if last {
                            Spacer()

                            CustomButton(title: "Start now", action: action).padding(.bottom, 60)
                        }
                    }.padding(.top, 62)
                }
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.4)
            }.foregroundColor(Color(CustomColors.colors.primaryForeground.rawValue))
        }
    }
}

struct OnboardingContentTriangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))

        return path
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
