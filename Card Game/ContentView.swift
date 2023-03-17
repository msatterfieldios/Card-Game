//
//  ContentView.swift
//  Memorize Game
//
//  Created by Mark on 2023-03-15.
//

import SwiftUI

struct ContentView: View {
   // Used at @State so the ver is a pointer.  Without this it make the array immutable.  Not sure why
   @State var emojis = ["🚗","🚕","🚙","🚌","🚎","🏎️","🚓","🚑",
                        "🚒","🚐","🛻","🚚","🚛","🚜","🚲","🛵",
                        "🏍️","🛺","🚠","✈️"]
    @State var emojiCount = 5
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.title)
                .fontWeight(.bold)
                .padding(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum:65))] ){
                    ForEach(emojis[0..<emojis.count], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                    
                }
//==================================== end of LazyVGrid ======================================
            }
            .foregroundColor(.red)
//===================================== end of ScrollView ======================================
            Spacer()
            HStack {
                transportation
                Spacer()
                vegetable
                Spacer()
                fitness
            }
//========================================= end of HStack for card type buttons ======================================
            .font(.largeTitle)
            .padding(.horizontal)
            HStack {
                Text("Automobiles")
                    .font(.title2)
                    .foregroundColor(.blue)
               Spacer()
                Text("Vegetable")
                    .font(.title2)
                    .foregroundColor(.blue)
                Spacer()
                Text("Fitness")
                    .font(.title2)
                    .foregroundColor(.blue)
               
            }
//========================================= end of HStack for Button Titles ======================================
        }
        .padding(.horizontal)
        
//========================================== end of VStack ======================================
        
    }
    
// ========================================= end of Body ========================================
    var transportation: some View {
        Button {
            if emojis.count > 1 {
                emojis.removeAll()
                emojis = ["🚗","🚕","🚙","🚌","🚎","🏎️","🚓","🚑",
                          "🚒","🚐","🛻","🚚","🚛","🚜","🚲","🛵",
                          "🏍️","🛺","🚠","✈️"]
                emojis.shuffle()
            }
        } label:{Image(systemName: "car")}
    }
//========================================== End of transportation Button ===================================

    var fitness: some View {
        Button {
            if emojis.count > 0 {
                emojis.removeAll()
                emojis = ["⚽️","🏀","🏈","⚾️","🥎","🎾","🏐","🏉","🥏","🎱"]
                emojis.shuffle()
            }
        } label:{Image(systemName: "figure.run")}
    }
//========================================== End of fitness Button ====================================
    var vegetable: some View {
        Button {
            if emojis.count > 0 {
                emojis.removeAll()
                emojis = ["🥦","🥬","🧅","🧄","🫑","🍆","🥔","🥗","🥒","🥕"]
                emojis.shuffle()
            }
        } label:{Image(systemName: "carrot")}
    }
//========================================== End of fitness Button ====================================

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
//=========================================== End of CardView ========================================
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                .preferredColorScheme(.dark)
            ContentView()
        }
    }

    

