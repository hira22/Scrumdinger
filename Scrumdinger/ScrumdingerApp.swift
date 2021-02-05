//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by hiraoka on 2021/02/02.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    // NOTE: the source of truth
    @State private var scrums = DailyScrum.data
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $scrums)
            }
        }
    }
}
