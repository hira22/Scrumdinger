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
    @ObservedObject private var data = ScrumData()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $data.scrums, saveAction: data.save)
            }
            .onAppear(perform: data.load)
        }
    }
}
