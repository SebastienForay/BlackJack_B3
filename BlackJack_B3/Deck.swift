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
    // Défini si la carte rouge a été trouvée
    var redCardFound: Bool = false;
    
    init(blueCardPos: Int)
    {
        self.players.insert(Player(), atIndex: 0);
        // Ajout du croupier en dernier
        self.players.append(Player());
        self.players.last!.isCroupier = true;
        //Ajout de la carte bleu
        self.cardpack.setBlueCard(blueCardPos)
    }
    
    // Récupère la première carte du cardpack et vérifie si c'est la rouge qui indique la fin du jeu
    func GetCard() -> Card
    {
        var retour: Card;
        
        retour = self.cardpack.GetFirstCard();
        
        if(retour.color == Color.Rouge)
        {
            self.redCardFound = true;
            retour = self.cardpack.GetFirstCard();
        }
        
        return retour;
    }
    
    // Distribution des cartes
    func CardsDistribution()
    {
        for _ in 1...2
        {
            for p in self.players
            {
                p.GiveCard(self.GetCard());
            }
        }
    }
}