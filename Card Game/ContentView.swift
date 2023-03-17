//
//  ContentView.swift
//  Memorize Game
//
//  Created by Mark on 2023-03-15.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["⚽️","🏀","🏈","⚾️","🥎","🎾","🏐","🏉","🥏","🎱","🪀","🏓","🏸","🏒","🏑","🥍","🏏","🪃","🥅","⛳️"]
    @State var emojiCount = 4
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum:65))] ){
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                    
                } //========== end of LazyVGrid
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                minus
                Spacer()
                plus
            }
            //========== end of HStack
            .font(.largeTitle)
            .padding(.horizontal)
        }  //============ end of VStack
        .padding(.horizontal)
    }
    // ======== End of Body
    var minus: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label:{Image(systemName: "minus.circle")}
    }
    //========== End of Minus Button

    var plus: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label:{Image(systemName: "plus.circle")}
    }
    //========= End of plus Button

    struct CardView: View {
        var content: String
        @State var isFaceUp:Bool = true
        var body: some View {
            ZStack{
                let shape = RoundedRectangle(cornerRadius: 20)
                if isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: 3)
                    Text(content).font(.largeTitle)
                }
                else {
                    shape.fill()
                }
            }
            .onTapGesture {
                isFaceUp = !isFaceUp
            }
        }
    }
    //========= End of CardView
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                .preferredColorScheme(.dark)
            ContentView()
        }
    }

    

