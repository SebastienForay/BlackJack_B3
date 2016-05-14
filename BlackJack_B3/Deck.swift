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
    
    init(blueCardPos: Int)
    {
        self.players.insert(Player(), atIndex: 0);
        // Ajout du croupier en dernier
        self.players.append(Player());
        self.players.last!.isCroupier = true;
        //Ajout de la carte bleu
        self.cardpack.setBlueCard(blueCardPos)
        //Distribution des cartes
        for _ in 1...2
        {
            for p in players
            {
                p.GiveCard(cardpack.GetFirstCard());
            }
        }
    }
}