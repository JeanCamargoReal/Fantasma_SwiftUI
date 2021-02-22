//
//  ContentView.swift
//  Fantasma
//
//  Created by Jean Camargo on 22/02/21.
//

import SwiftUI

struct FantasmaView: View {
    
    @State private var time: Double = 0
    @State private var offset: CGFloat = 0
    @State private var shadowSize: CGFloat = 10
    
    var body: some View {

        ZStack {
            Circle()
                .frame(width: backgroundSize, height: backgroundSize)
                .foregroundColor(Color(red: 242, green: 229, blue: 0.39))
            Circle()
                .trim(from: 3/4, to: 1)
                .frame(width: backgroundSize, height: backgroundSize)
                .foregroundColor(.white)
                .rotationEffect(.degrees(135))
                .offset(y: 1)
            Circle()
                .frame(width: fantasmaSize - shadowSize, height: fantasmaSize - shadowSize)
                .rotation3DEffect(.degrees(80), axis: (x: 1.0, y: 0.0, z: 0.0))
                .offset(x: 0, y: fantasmaSize / 1.6)
                .blur(radius: 3)
            ZStack {
                Fantasma(time: CGFloat(time), width: fantasmaSize, height: fantasmaSize * 2.5, curveHeight: fantasmaCurveHeight, curveLength: fantasmaCurveLength)
                    .foregroundColor(Color(red: 0.99, green: 0.33, blue: 0.62))
                    .mask(Capsule().frame(width: fantasmaSize, height: fantasmaSize * 2.5))
                    .offset(x: 0, y: fantasmaSize / 2)
                Circle()
                    .frame(width: fantasmaSize / 6, height: fantasmaSize / 6)
                    .offset(x: 0, y: -(fantasmaSize / 3))
                Circle()
                    .frame(width: fantasmaSize / 6, height: fantasmaSize / 6)
                    .offset(x: fantasmaSize / 3.75, y: -(fantasmaSize / 3))
                Circle()
                    .frame(width: fantasmaSize / 10, height: fantasmaSize / 10)
                    .offset(x: fantasmaSize / 5, y: -(fantasmaSize / 7.5))
            }
            .offset(y: offset)
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { _ in
                self.time += 0.004
            }
            withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                offset += -30
                shadowSize = 30
            }
        }
    }
    
    //MARK: - Drawing constant
    let backgroundSize: CGFloat = 350
    let fantasmaSize: CGFloat = 150
    let fantasmaCurveHeight: CGFloat = 10
    let fantasmaCurveLength: CGFloat = 12
}

struct Ghost_Previews: PreviewProvider {
    static var previews: some View {
        FantasmaView()
    }
}
