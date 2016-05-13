//
//  Deck.swift
//  BlackJack_B3
//
//  Created by Alexandre Giroud-Bit on 09/05/16.
//  Copyright © 2016 Alexandre Giroud-Bit. All rights reserved.
//

import Foundation

class Deck
{
    //Une table a de 1 à 8 joueurs
    var players = [Player]();
    //Une table a un sabot
    var cardpack = CardPack();
    
    var numberOfPlayers: Int = 0;
    
    init(nbPlayers: Int)
    {
        self.numberOfPlayers = nbPlayers;
        
        for i in 0...self.numberOfPlayers
        {
            if(i != self.numberOfPlayers)
            {
                self.players.insert(Player(), atIndex: 0);
            }
            else
            {
                // Ajout du croupier en dernier
                self.players.insert(Player(), atIndex: numberOfPlayers);
                self.players[numberOfPlayers].isCroupier = true;
            }
        }
        
        for _ in 1...2
        {
            for i in 0...players.count-1
            {
                players[i].GiveCard(cardpack.GetFirstCard());
            }
        }
        
        let randPlayer = Int(arc4random_uniform(UInt32(self.numberOfPlayers)) + 1);
        let bcPosition = self.players[randPlayer].AskBlueCardPosition();
        
        self.cardpack.cards.insert(Card(color: Color.Bleu, value: 0), atIndex: bcPosition);
    }
}