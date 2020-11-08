//
//  SwagTimerApp.swift
//  SwagTimer
//
//  Created by Anthony Da Cruz on 08/11/2020.
//

import SwiftUI

@main
struct SwagTimerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(TimerHolder())
        }
    }
}
