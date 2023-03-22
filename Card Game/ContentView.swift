//
//  ContentView.swift
//  Memorize Game
//
//  Created by Mark on 2023-03-15.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum:60))] ){
                ForEach(viewModel.cards) { card in
                    CardView(card:card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
              
            }
            //==================================== end of LazyVGrid ======================================
           
        }
        .foregroundColor(.red)
        .padding(.horizontal)
        
    }
}
    
// ========================================= end of Body ========================================
    
   

    struct CardView: View {
        
        let card:MemoryGame<String>.Card
        
        var body: some View {
            ZStack{
                let shape = RoundedRectangle(cornerRadius: 20)
                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: 3)
                    Text(card.content).font(.largeTitle)
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
//=========================================== End of CardView ========================================

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
//=========================== Create our ViewModel ============================
        let game = EmojiMemoryGame()
//=========================== Pass our viewModel to the view ====================
            ContentView(viewModel: game)
                .preferredColorScheme(.dark)
            ContentView(viewModel: game)
        }
    }

    

