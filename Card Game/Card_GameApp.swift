//
//  Card_GameApp.swift
//  Card Game
//
//  Created by Mark on 2023-03-16.
//

import SwiftUI

@main
struct Card_GameApp: App {
    
//================================= Creating the ModelView ==============================
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
//================================= Pass the viewModel to our view =======================
            ContentView(viewModel: game)
        }
    }
}
