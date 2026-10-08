//
//  ProgressRing.swift
//  Progress Dashboard
//
//  Created by Isaac Luke on 10/2/26.
//

import SwiftUI

struct ProgressRing: Shape {
    static let lineWidth = 12.0

    let progress: Double

    func path(in rect: CGRect) -> Path {
        let radius = min(rect.width, rect.height) / 2 - Self.lineWidth / 2
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                    radius: radius,
                    startAngle: Angle(degrees: -90),
                    endAngle: Angle(degrees: -90 + 360 * progress),
                    clockwise: false)
        return path
    }
}

#Preview {
    ProgressRing(progress: 0.6)
        .stroke(.blue, style: StrokeStyle(lineWidth: ProgressRing.lineWidth, lineCap: .round))
        .frame(width: 100, height: 100)
}
