//
//  Cardify.swift
//  Card Game
//
//  Created by Mark on 2023-04-18.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    
    init(isFaceup: Bool) {
        rotation = isFaceup ? 0 : 180
    }
    var rotation: Double // in degrees
    var animatableData: Double {
        get {rotation}
        set { rotation = newValue}
    }
    
    
    func body(content: Content) -> some View {
        ZStack{
            let shape = RoundedRectangle(cornerRadius: DrawingConstant.cornerRadius)
            if rotation < 90 {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: DrawingConstant.lineWidth)
               // content
            }
            else {
                shape.fill()
            }
            content.opacity(rotation < 90 ? 1 : 0)
        }
        .rotation3DEffect(Angle.degrees(rotation), axis: (x: 0, y: 1, z: 0))
        // end of ZStack
    }
    private struct DrawingConstant {
        static let cornerRadius:CGFloat = 10
        static let lineWidth:CGFloat = 3
    }
}
extension View {
    func cardify(isFaceUp: Bool) -> some View {
        return self.modifier(Cardify(isFaceup: isFaceUp))
    }
}
