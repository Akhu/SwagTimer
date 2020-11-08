//
//  GaugeTimerView.swift
//  SwagTimer
//
//  Created by Anthony Da Cruz on 08/11/2020.
//

import SwiftUI

public struct GaugeTimerView: View {
    let progress: CGFloat
    let gradientColors = [Color(#colorLiteral(red: 0.4745098039215686, green: 0.8392156862745098, blue: 0.9764705882352941, alpha: 1.0)), Color(#colorLiteral(red: 0.36470588235294116, green: 0.06666666666666667, blue: 0.9686274509803922, alpha: 1.0))]
    let timerContent: Text
    
    public init(progress: CGFloat = 0.7, timerContent: Text){
        self.progress = progress
        print(progress)
        self.timerContent = timerContent
    }
    public var body: some View {
        VStack {
            GeometryReader { geometry in
                let geoFrame = geometry.frame(in: .local)
                ZStack {
                    Circle()
                        .trim(from: 0.4, to: 1)
                    .rotation(Angle(degrees: 20))
                        .stroke(style:StrokeStyle(lineWidth: 25, lineCap: .round))
                        .fill(
                            LinearGradient(gradient: Gradient(colors: self.gradientColors), startPoint: .leading, endPoint: .trailing))
                        .opacity(0.6)
                        .frame(width: geometry.size.width/2, height: geometry.size.height/1.5)
                        .position(x: geoFrame.midX, y: geoFrame.midY)
                    Circle()
                        .trim(from: 0.4, to: 1)
                        .rotation(Angle(degrees: 20))
                        .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                        .stroke(style: StrokeStyle(
                            lineWidth: 25, lineCap: .round))
                        .fill(LinearGradient(gradient: Gradient(colors: self.gradientColors), startPoint: .leading, endPoint: .trailing))
                        .frame(width: geometry.size.width/2, height: geometry.size.height/1.5)
                        .position(x: geoFrame.midX, y: geoFrame.midY)
                    timerContent
                        .position(x: geoFrame.midX, y: geoFrame.midY)
                }
            }
        }
    }
}

struct GaugeTimerView_Previews: PreviewProvider {
    static var previews: some View {
        GaugeTimerView(progress: 0.1, timerContent: Text(Date(), style: .timer))
    }
}
