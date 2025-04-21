//
//  ContentView.swift
//  Pomodoro
//
//  Created by Saurabh Jaiswal on 21/04/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var pomodoroModel: PomodoroModel
    var body: some View {
        Home()
            .environmentObject(pomodoroModel)
    }
}

#Preview {
    ContentView()
}
