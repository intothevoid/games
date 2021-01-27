//
//  memoriseApp.swift
//  memorise
//
//  Created by Karan Kadam on 26/1/21.
//

import SwiftUI

@main
struct memoriseApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
