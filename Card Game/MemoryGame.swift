//
//  MemoryGame.swift
//  Card Game
//
//  Created by Mark on 2023-03-18.
//  This is our model for the card game

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    private var indexOfTheOneAndOnlyFaceUpCard: Int?

    
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
               indexOfTheOneAndOnlyFaceUpCard = nil
           } else {
               for index in cards.indices {
                   cards[index].isFaceUp = false
               }
               indexOfTheOneAndOnlyFaceUpCard = chosenIndex
           }
           cards[chosenIndex].isFaceUp.toggle()
       }
        print("\(cards)")
    }
//======================================== End func choose  ======================================
//                                               This function gets replaced by the inlind function above
//    func index(of card:Card) -> Int? {
//        for index in 0..<cards.count {
//            if cards[index].id == card.id {
//                return index
//            }
//        }
//        return nil
//    }
    
//======================================== Begin init ============================================
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2 + 1))
        }
    }
//======================================== End init ================================================
//======================================== Begin Card struct  =======================================
    struct Card:Identifiable {
        
        var isFaceUp:Bool = false
        var isMatched:Bool = false
        var content: CardContent
        var id: Int

    
    }
//======================================== End Card struct  =======================================
}
