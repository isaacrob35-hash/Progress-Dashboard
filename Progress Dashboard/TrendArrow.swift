//
//  TrendArrow.swift
//  Progress Dashboard
//
//  Created by Isaac Luke on 10/2/26.
//

import SwiftUI

struct TrendArrow: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

#Preview {
    TrendArrow()
        .fill(.green)
        .frame(width: 40, height: 40)
}
