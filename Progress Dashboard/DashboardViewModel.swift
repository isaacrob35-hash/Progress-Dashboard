//
//  DashboardViewModel.swift
//  Progress Dashboard
//
//  Created by Isaac Luke on 10/2/26.
//

import SwiftUI

@Observable
class DashboardViewModel {
    private(set) var metrics: [Metric] = [
        Metric(name: "Workouts", current: 5, goal: 5, weeklyChange: 2),
        Metric(name: "Glasses of Water", current: 2, goal: 8, weeklyChange: -1),
        Metric(name: "Chapters Read", current: 3, goal: 10, weeklyChange: 1)
    ]

    func addProgress(_ amount: Int, to metric: Metric) {
        for index in metrics.indices {
            if metrics[index].id == metric.id {
                metrics[index].current = min(metrics[index].current + amount, metrics[index].goal)
            }
        }
    }
}
