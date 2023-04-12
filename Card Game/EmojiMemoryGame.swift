//
//  EmojiMemoryGame.swift
//  Card Game
//
//  Created by Mark on 2023-03-18.
//  Our View Model for the card game

import SwiftUI

//========================= This is our ViewModel ===================================
class EmojiMemoryGame:ObservableObject {
    typealias Card = MemoryGame<String>.Card
   private static let emojis = ["🚗","🚕","🚙","🚌","🚎","🏎️","🚓","🚑","🚒","🚐","🛻","🚚","🚛","🚜","🚲","🛵","🏍️","🛺","🚠","✈️"]
   private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 8) { pairIndex in
            emojis[pairIndex]
        }
    }
 //======================= Published says if this changes to let the world know ===========================
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card>{
         model.cards
    }
   

//================================= MARK: - Intent(s) ===================================
    func choose(_ card:Card) {
        model.choose(card)
    }
}
