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
    // Table de jeu
    var deck: Deck;
    weak var view: DeckViewController?;
    
    weak var player: Player?;
    weak var croupier: Player?;
    
    init(cardPos: Int, view: DeckViewController?)
    {
        self.deck = Deck(blueCardPos: cardPos);
        self.view = view;
        print("Game created, blue card position in cardpack : \(cardPos)");
        
        self.player = self.deck.players[0];
        self.croupier = self.deck.players[1];
    }
    
    func Play()
    {
        repeat
        {
            // Le joueur fait sa mise
            
            //TODO Changer de systeme par rapport aux boutons
            view?.miser();
            // Distribution des cartes
            self.deck.CardsDistribution();
            
            // Si la première carte du croupier est un AS
            if(self.croupier!.cards[0].value == 1)
            {
                let playerInitialBetValue: Int = self.player!.bet!.initialBet;
                
                // Si le joueur a de quoi payer son assurance avec la moitié de sa mise initiale
                if(self.player!.bet!.totalBetValue % (playerInitialBetValue / 2) == 0)
                {
                    // Popup pour demander s'il veut assurer
                    view?.assurer();
                    
                    // si le joueur veut assurer:
                    if(self.player!.AssureBet())
                    {
                        // TODO: Popup de confirmation d'assurance prise par le joueur
                    }
                    else
                    {
                        // TODO: Popup de non confirmation pour dire que l'assurance ne peut pas etre payé
                        // si jamais il y a eu un soucis dans le calcul qui vérifiais ça
                    }
                }
            }
        
            repeat
            {
                // TODO: choix stay, card, ou leave
            }
            while self.player!.GetCardsTotalValue() < 21;
            
            // TODO: croupier retourne deuxieme carte
            // algo stay tant que moins de 16
        }
        // Répète tant que le total de lma mise du joueur est > 0
        while self.player!.bet!.totalBetValue > 0;
        
        // TODO: Fin de la partie, GAME OVER
    }
}