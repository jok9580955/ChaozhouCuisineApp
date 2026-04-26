//
//  _______App.swift
//  潮州菜菜谱精选
//
//  Created by ll on 2026/4/26.
//

import SwiftUI

@main
struct _______App: App {
    @AppStorage("darkMode") private var darkMode = false
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(darkMode ? .dark : .light)
        }
    }
}
