//
//  PomodoroApp.swift
//  Pomodoro
//
//  Created by Saurabh Jaiswal on 21/04/25.
//

import SwiftUI

@main
struct PomodoroApp: App {
    // MARK: Since we are doing background fetching Initializing here
    @StateObject var pomodoroModel: PomodoroModel = .init()
    
    // MARK: Scene Phase
    @Environment(\.scenePhase) var phase
    
    // MARK: Storing last time stamp
    @State var lastTimeStamp: Date = Date()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(pomodoroModel)
        }
        .onChange(of: phase) { newValue in
            if pomodoroModel.isStarted {
                if newValue == .background {
                    lastTimeStamp = Date()
                }
                
                if newValue == .active {
                    // MARK: Finding the difference
                    let currentTimeStampDiff = Date().timeIntervalSince(lastTimeStamp)
                    if pomodoroModel.totalSeconds - Int(currentTimeStampDiff) <= 0 {
                        pomodoroModel.isStarted = false
                        pomodoroModel.totalSeconds = 0
                        pomodoroModel.isFinished = true
                    } else {
                        pomodoroModel.totalSeconds -= Int(currentTimeStampDiff)
                    }
                    
                    
                }
            }
        }
    }
}
