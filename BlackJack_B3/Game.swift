//
//  Game.swift
//  BlackJack_B3
//
//  Created by Supinfo on 16/05/2016.
//  Copyright © 2016 Alexandre Giroud-Bit. All rights reserved.
//

import Foundation

class Game
{
    var deck: Deck;
    
    init(cardPos: Int)
    {
        self.deck = Deck(blueCardPos: cardPos);
    }
}