//
//  EmojiMemoryGame.swift
//  Card Game
//
//  Created by Mark on 2023-03-18.
//  Our View Model for the card game

import SwiftUI

//========================= This is our ViewModel ===================================
class EmojiMemoryGame:ObservableObject {
    static let emojis = ["🚗","🚕","🚙","🚌","🚎","🏎️","🚓","🚑","🚒","🚐","🛻","🚚","🚛","🚜","🚲","🛵","🏍️","🛺","🚠","✈️"]
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 7) { pairIndex in
            emojis[pairIndex]
        }
    }
 //======================= Published says if this changes to let the world know ===========================
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card>{
         model.cards
    }
//================================= MARK: - Intent(s) ===================================
    func choose(_ card:MemoryGame<String>.Card) {
        model.choose(card)
    }
}
