//
//  MemoryGame.swift
//  Card Game
//
//  Created by Mark on 2023-03-18.
//  This is our model for the card game

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
//======================================== Begin func choose  =======================================
    func choose(_ card: Card) {
        
    }
//======================================== End func choose  =======================================
//======================================== Begin init ============================================
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
//======================================== End init ================================================
//======================================== Begin Card struct  =======================================
    struct Card {
        var isFaceUp:Bool = false
        var isMatched:Bool = false
        var content: CardContent
    
    }
//======================================== End Card struct  =======================================
}
