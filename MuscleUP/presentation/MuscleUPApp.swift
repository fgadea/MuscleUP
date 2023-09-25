//
//  MuscleUPApp.swift
//  MuscleUP
//
//  Created by Felipe Gadea Llopis on 27/8/23.
//

import SwiftUI


@main
struct MuscleUPApp: App {
    @ObservedObject var router: Router = Router()

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navPath) {
                HomeView()
                    .navigationDestination(for: Router.Destination.self) { destination in
                    switch destination {
                    case .onboarding:
                        OnboardingView()
                    case .home:
                        HomeView()
                    case .profilesetup:
                        ProfileSetUpView()
                    }
                }
            }
                .environmentObject(router).preferredColorScheme(.dark)
        }
    }
}

