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
        VStack {
            gameBody
            shuffle
        }
        .padding()
        
    }
    var gameBody: some View {
        AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
            
            if card.isMatched && !card.isFaceUp {
                Color.clear
            } else {
                CardView(card:card)
                    .padding(4)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 3)) {
                            game.choose(card)
                        }
                    }
            }
        }
        .foregroundColor(Color.red)
    }
    var shuffle: some View {
        Button("Shuffle") {
            withAnimation {
                game.shuffle()
            }
        }
    }
}
    
// ========================================= end of Body ========================================
    
    struct CardView: View {
        
        let card:EmojiMemoryGame.Card
        
        var body: some View {
            GeometryReader {geometry in
                ZStack{
                    Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 110-90))
                        .padding(5).opacity(0.5)
                    Text(card.content)
                        .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                        .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                        .font(Font.system(size: DrawingConstant.fontSize))
                        .scaleEffect(scale(thatFits: geometry.size))
                }
                .cardify (isFaceUp: card.isFaceUp)
                // end of ZStack
                
            }
            
        }
        private func scale(thatFits size: CGSize) -> CGFloat {
            min(size.width, size.height) / (DrawingConstant.fontSize / DrawingConstant.fontScale)
        }
        
        
        private struct DrawingConstant {
            static let fontScale:CGFloat = 0.65
            static let fontSize: CGFloat = 32
            
        }
        
    }
//=========================================== End of CardView ========================================

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
//=========================== Create our ViewModel ============================
        let game = EmojiMemoryGame()
//=========================== Pass our viewModel to the view ====================
          //  game.choose(game.cards.first!)
            return EmojiMemoryGameView(game: game)
        }
    }

    

