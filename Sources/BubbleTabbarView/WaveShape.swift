//
//  WaveShape.swift
//  
//
//  Created by Nguyen Chi Thanh on 09/02/2021.
//

import SwiftUI

struct WaveShape: Shape {
    var xAxis: CGFloat

    var animatableData: CGFloat {
        get {
            return xAxis
        }
        set {
            xAxis = newValue
        }
    }
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: .init(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: .init(x: rect.width, y: rect.height))
            path.addLine(to: .init(x: 0, y: rect.height))
                        
            let center = xAxis
            let radius: CGFloat = 25 + 32
            path.move(to: CGPoint(x: center - radius, y: 0))
            
            let controlPadding = radius / 2

            let to1 = CGPoint(x: center, y: rect.height / 3)
            let control1 = CGPoint(x: center - controlPadding, y: 0)
            let control2 = CGPoint(x: center - controlPadding, y: rect.height / 3)
            
            let to2 = CGPoint(x: center + radius, y: 0)
            let control3 = CGPoint(x: center + controlPadding, y: rect.height / 3)
            let control4 = CGPoint(x: center + controlPadding, y: 0)
            
            path.addCurve(to: to1, control1: control1, control2: control2)
            path.addCurve(to: to2, control1: control3, control2: control4)
        }
    }
}

