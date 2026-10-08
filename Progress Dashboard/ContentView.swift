//
//  ContentView.swift
//  Progress Dashboard
//
//  Created by Isaac Luke on 10/2/26.
//

import SwiftUI

struct ContentView: View {
    let viewModel = DashboardViewModel()

    var body: some View {
        ZStack {
            background
            ScrollView {
                VStack(spacing: 20) {
                    header
                    ForEach(viewModel.metrics) { metric in
                        metricSection(for: metric)
                    }
                }
                .padding()
            }
        }
    }

    private var background: some View {
        LinearGradient(colors: [.teal, .indigo],
                       startPoint: .top,
                       endPoint: .bottom)
            .ignoresSafeArea()
    }

    private var header: some View {
        Text("Weekly Progress")
            .font(.largeTitle)
            .bold()
            .foregroundStyle(.white)
    }

    private func metricSection(for metric: Metric) -> some View {
        HStack {
            MetricTile(name: metric.name,
                       current: metric.current,
                       goal: metric.goal,
                       progress: metric.progress,
                       isImproving: metric.isImproving,
                       isComplete: metric.isComplete)
            Button("+1") {
                viewModel.addProgress(1, to: metric)
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    ContentView()
}
