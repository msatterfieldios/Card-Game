//
//  EmojiMemoryGame.swift
//  Card Game
//
//  Created by Mark on 2023-03-18.
//  Our View Model for the card game

import SwiftUI


class EmojiMemoryGame {
    static let emojis = ["🚗","🚕","🚙","🚌","🚎","🏎️","🚓","🚑","🚒","🚐","🛻","🚚","🚛","🚜","🚲","🛵","🏍️","🛺","🚠","✈️"]
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    private var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
        
            emojis[pairIndex]
        }
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
}
