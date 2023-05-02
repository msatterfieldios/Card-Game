//
//  MemoryGame.swift
//  Card Game
//
//  Created by Mark on 2023-03-18.
//  This is our model for the card game

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            let faceUpCardIndices = cards.indices.filter ( {cards[$0].isFaceUp})
            return faceUpCardIndices.oneAndOnly
        }
        set {cards.indices.forEach{cards[$0].isFaceUp = ($0 == newValue)}
            
            }
        }

    
    //======================================== Begin func choose  =======================================
   mutating func choose(_ card: Card) {
      //if let chosenIndex = index(of:card) {
       if let chosenIndex = cards.firstIndex(where: {$0.id == card.id})
            ,!cards[chosenIndex].isFaceUp
            ,!cards[chosenIndex].isMatched
       {
           if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
               if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                   cards[chosenIndex].isMatched = true
                   cards[potentialMatchIndex].isMatched = true
               }
               cards[chosenIndex].isFaceUp = true
           } else {
               
               indexOfTheOneAndOnlyFaceUpCard = chosenIndex
           }
       }
        print("\(cards)")
    }
//======================================== End func choose  ======================================
    mutating func shuffle() {
        cards.shuffle()
    }
    
//======================================== Begin init ============================================
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2 + 1))
        }
        cards.shuffle()
    }
//======================================== End init ================================================
//======================================== Begin Card struct  =======================================
    struct Card:Identifiable {
        
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
        var id: Int

        
    }
}
extension Array {
    var oneAndOnly: Element? {
        if count == 1 {
            return first
        } else {
            return nil
            
        }
    }
}
