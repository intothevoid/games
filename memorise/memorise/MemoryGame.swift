//
//  MemoryGame.swift
//  memorise
//
//  Created by Karan Kadam on 26/1/21.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        print("Card chosen: \(card)")
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var cardContent: CardContent
    }
}
