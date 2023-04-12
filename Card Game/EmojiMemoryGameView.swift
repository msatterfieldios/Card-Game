//
//  EmojiMemoryGameView.swift
//  Memorize Game
//
//  Created by Mark on 2023-03-15.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var game: EmojiMemoryGame
    
    
    var body: some View {
        
//        ScrollView {
//            LazyVGrid(columns: [GridItem(.adaptive(minimum:100))] ){
//                ForEach(game.cards) { card in
        AspectVGrid(items: game.cards, aspectRatio: 2/3, content: {card in
            
        
                    CardView(card:card)
                        .padding(4)
                        .onTapGesture {
                            game.choose(card)
                        }
        })
//                }
//            }
//
//            //==================================== end of LazyVGrid ======================================
//
//        }
        .padding(.horizontal)
        .foregroundColor(Color.red)
    }
}
    
// ========================================= end of Body ========================================
    
    struct CardView: View {
        
        let card:MemoryGame<String>.Card
        
        var body: some View {
            GeometryReader {geometry in
                ZStack{
                    let shape = RoundedRectangle(cornerRadius: DrawingConstant.cornerRadius)
                    if card.isFaceUp {
                        shape.fill().foregroundColor(.white)
                        shape.strokeBorder(lineWidth: DrawingConstant.lineWidth)
                        Text(card.content).font(font(in:geometry.size))
                    } else if card.isMatched {
                        shape.opacity(0)
                    }
                    else {
                        shape.fill()
                    }
                }
                // end of ZStack
            }
            
            }
        private func font(in size: CGSize) -> Font {
            Font.system(size:min(size.width, size.height)*DrawingConstant.fontScale)
        }
        
        private struct DrawingConstant {
            static let cornerRadius:CGFloat = 10
            static let lineWidth:CGFloat = 3
            static let fontScale:CGFloat = 0.75
            
        }
        
    }
//=========================================== End of CardView ========================================

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
//=========================== Create our ViewModel ============================
        let game = EmojiMemoryGame()
//=========================== Pass our viewModel to the view ====================
            EmojiMemoryGameView(game: game)
                .preferredColorScheme(.dark)
            EmojiMemoryGameView(game: game)
        }
    }

    

