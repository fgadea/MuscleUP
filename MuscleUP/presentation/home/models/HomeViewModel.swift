//
//  HomeViewModel.swift
//  MuscleUP
//
//  Created by Felipe Gadea Llopis on 30/8/23.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    var mainTitle = "Hello"
    var userName = "Felipe"
    var mainDescription = "Good Morning"
    @Published var viewGenericConfiguration = HomeViewConfiguration()
    @Published var segmentSelection = 0
    @Published var todaySection: Section = Section(title: "Today Workout Plan", actionTitle: "mon 26 apr", content: [SectionContent(imageName: "onboarding1", title: "Day 01 - Warm Up", subtitle: "07:00 - 08:00 AM")])
    @Published var workoutSection: Section = Section(title: "Workout Categories", actionTitle: "See All", content: [SectionContent(imageName: "onboarding1", title: "Learn the Basic of Training", subtitle: "06 Workouts for Beginner"), SectionContent(imageName: "onboarding1", title: "Learn the Basic of Training", subtitle: "06 Workouts for Beginner"), SectionContent(imageName: "onboarding1", title: "Learn the Basic of Training", subtitle: "06 Workouts for Beginner"), SectionContent(imageName: "onboarding1", title: "Learn the Basic of Training", subtitle: "06 Workouts for Beginner")])
    @Published var newSection: Section = Section(title: "New Workout", actionTitle: nil, content: [SectionContent(imageName: "onboarding1", title: "Top Heartrate", subtitle: "Workouts for Advance"), SectionContent(imageName: "onboarding1", title: "Fat Burner", subtitle: "Workouts for Beginner")])
    
    func getWorkoutSections() -> [SectionContent] {
        switch(segmentSelection) {
        case 0:
            return [SectionContent(imageName: "onboarding1", title: "Learn the Basic of Training", subtitle: "06 Workouts for Beginner"), SectionContent(imageName: "onboarding1", title: "Learn the Basic of Training", subtitle: "06 Workouts for Beginner"), SectionContent(imageName: "onboarding1", title: "Learn the Basic of Training", subtitle: "06 Workouts for Beginner"), SectionContent(imageName: "onboarding1", title: "Learn the Basic of Training", subtitle: "06 Workouts for Beginner")]
        case 1:
            return [SectionContent(imageName: "onboarding1", title: "Learn the Basic of Training", subtitle: "07 Workouts for Internediate"), SectionContent(imageName: "onboarding1", title: "Learn the Basic of Training", subtitle: "07 Workouts for Internediate"), SectionContent(imageName: "onboarding1", title: "Learn the Basic of Training", subtitle: "07 Workouts for Internediate"), SectionContent(imageName: "onboarding1", title: "Learn the Basic of Training", subtitle: "07 Workouts for Internediate")]
        case 2:
            return [SectionContent(imageName: "onboarding1", title: "Learn the Basic of Training", subtitle: "08 Workouts for Advance"), SectionContent(imageName: "onboarding1", title: "Learn the Basic of Training", subtitle: "08 Workouts for Advance"), SectionContent(imageName: "onboarding1", title: "Learn the Basic of Training", subtitle: "08 Workouts for Advance"), SectionContent(imageName: "onboarding1", title: "Learn the Basic of Training", subtitle: "08 Workouts for Advance")]
        default:
            return [SectionContent(imageName: "onboarding1", title: "Learn the Basic of Training", subtitle: "06 Workouts for Beginner"), SectionContent(imageName: "onboarding1", title: "Learn the Basic of Training", subtitle: "06 Workouts for Beginner"), SectionContent(imageName: "onboarding1", title: "Learn the Basic of Training", subtitle: "06 Workouts for Beginner"), SectionContent(imageName: "onboarding1", title: "Learn the Basic of Training", subtitle: "06 Workouts for Beginner")]
        }
    }
}

struct HomeViewConfiguration {
    let fontStyle = Font.custom("Integral CF", size: 17)
    let titleStyle = Font.custom("Integral CF", size: 32)
    let subtitleStyle = Font.custom("Integral CF", size: 12)
    let segments = [
        Segment(id: 0, text: "Beginner"),
        Segment(id: 1, text: "Internediate"),
        Segment(id: 2, text: "Advance")
    ]
}

struct Section {
    let title: String
    let actionTitle: String?
    var content: [SectionContent]
}

struct SectionContent: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let subtitle: String
}
