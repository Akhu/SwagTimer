//
//  TimerHolder.swift
//  SwagTimer
//
//  Created by Anthony Da Cruz on 08/11/2020.
//

import Foundation
import Combine

class TimerHolder : ObservableObject {
    var timer : Timer!
    //@Published let timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()
    let didChange = PassthroughSubject<TimerHolder,Never>()
    @Published var count = 0 {
        didSet {
            self.didChange.send(self)
        }
    }
    
    func start() {
        self.timer?.invalidate()
        self.count = 0
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
            _ in
            self.count += 1
        }
    }
}

