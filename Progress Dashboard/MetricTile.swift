//
//  MetricTile.swift
//  Progress Dashboard
//
//  Created by Isaac Luke on 10/2/26.
//

import SwiftUI

struct MetricTile: View {
    let name: String
    let current: Int
    let goal: Int
    let progress: Double
    let isImproving: Bool
    let isComplete: Bool

    var body: some View {
        HStack(spacing: 16) {
            ring
            details
            Spacer()
        }
        .padding()
        .frame(width: 270)
        .background(.white)
        .cornerRadius(15)
        .shadow(radius: 5)
    }

    private var ringStyle: StrokeStyle {
        StrokeStyle(lineWidth: ProgressRing.lineWidth, lineCap: .round)
    }

    private var ring: some View {
        ZStack {
            ProgressRing(progress: 1.0)
                .stroke(Color.gray.opacity(0.3), style: ringStyle)
            ProgressRing(progress: progress)
                .stroke(isComplete ? Color.green : Color.blue, style: ringStyle)
            Text("\(Int(progress * 100))%")
                .bold()
        }
        .frame(width: 80, height: 80)
    }

    private var details: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(name).font(.headline)
            Text("\(current) of \(goal)")
            HStack {
                arrow
                celebration
            }
        }
    }

    private var arrow: some View {
        TrendArrow()
            .fill(isImproving ? Color.green : Color.red)
            .frame(width: 16, height: 16)
            .rotationEffect(.degrees(isImproving ? 0 : 180))
    }

    private var celebration: some View {
        Group {
            if isComplete {
                Text("✅ Goal!")
                    .bold()
                    .foregroundStyle(.green)
            }
        }
    }
}

#Preview {
    MetricTile(name: "Workouts", current: 3, goal: 5, progress: 0.6, isImproving: true, isComplete: false)
}
