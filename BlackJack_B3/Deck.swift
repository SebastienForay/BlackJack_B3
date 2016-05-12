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
    
    init()
    {
        repeat
        {
            print("Combien de joueurs dans la partie ? (1 - 8)");
            let input = readLine();
            self.numberOfPlayers = Int(input!)!;
        }
            while(self.numberOfPlayers < 1 || self.numberOfPlayers > 8)
        
        for i in 0...self.numberOfPlayers
        {
            if(i != self.numberOfPlayers)
            {
                players.insert(Player(), atIndex: 0);
            }
            else
            {
                // Ajout du croupier en dernier
                players.insert(Player(), atIndex: numberOfPlayers);
                players[numberOfPlayers].isCroupier = true;
            }
        }
        
        for _ in 1...2
        {
            for i in 0...players.count-1
            {
                players[i].GiveCard(cardpack.GetFirstCard());
            }
        }
    }
}