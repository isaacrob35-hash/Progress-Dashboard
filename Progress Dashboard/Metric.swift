//
//  Metric.swift
//  Progress Dashboard
//
//  Created by Isaac Luke on 10/2/26.
//

import Foundation

struct Metric: Identifiable {
    let id = UUID()
    let name: String
    var current: Int
    let goal: Int
    let weeklyChange: Int

    var progress: Double {
        min(Double(current) / Double(goal), 1.0)
    }

    var isImproving: Bool {
        weeklyChange > 0
    }

    var isComplete: Bool {
        progress >= 1.0
    }
}
