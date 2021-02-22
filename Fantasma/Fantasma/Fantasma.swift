//
//  Fantasma.swift
//  Fantasma
//
//  Created by Jean Camargo on 22/02/21.
//

import SwiftUI

struct Fantasma: Shape {
    var time: CGFloat
    let width: CGFloat
    let height: CGFloat
    let curveHeight: CGFloat
    let curveLength: CGFloat
    
    func path(in rect: CGRect) -> Path {
        return (
            Path { path in
                path.move(to: CGPoint(x: rect.maxX, y: rect.minY))
                path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
                
                for i in stride(from: 0, to: CGFloat(rect.width), by: 1) {
                    path.addLine(to: CGPoint(x: i, y: sin(((i / rect.height) + time) * curveLength * .pi) * curveHeight + rect.midY))
                }
                path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            }
        )
    }
    
}
