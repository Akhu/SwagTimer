//
//  ContentView.swift
//  SwagTimer
//
//  Created by Anthony Da Cruz on 08/11/2020.
//

import SwiftUI

func timeFormatted(_ totalSeconds: Int) -> String {
    let seconds: Int = totalSeconds % 60
    let minutes: Int = (totalSeconds / 60) % 60
    return String(format: "%02d:%02d", minutes, seconds)
}

struct ContentView: View {
    @EnvironmentObject var timerHolder : TimerHolder
    
    @State var countDownTarget = 10.0
    var targetTime = 10.0
    
    var body: some View {
        VStack {
            GaugeTimerView(progress: CGFloat(countDownTarget / targetTime), timerContent: Text(timeFormatted(Int(countDownTarget))))
                .onReceive(timerHolder.$count) { time in
                    withAnimation {
                        self.countDownTarget = self.countDownTarget - 1
                    }
                    if self.countDownTarget == 0 {
                        print("Timer done !")
                        timerHolder.timer.invalidate()
                    } else {
                        print("TimeLeft is now \(timeFormatted(Int(countDownTarget)))")
                    }
                }
            Button("Start Timer") { self.timerHolder.start() }
            Text("Target Time \(String(describing: countDownTarget / targetTime))")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .environmentObject(TimerHolder())
    }
}
