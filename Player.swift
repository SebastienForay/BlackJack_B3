//
//  Player.swift
//  BlackJack_B3
//
//  Created by Alexandre Giroud-Bit on 09/05/16.
//  Copyright © 2016 Alexandre Giroud-Bit. All rights reserved.
//

import Foundation

//Jetons (rawValue = valeur du jeton)
enum Chip: Int
{
    case Blanc = 1
    case Rouge = 5
    case Vert = 25
    case Noir = 100
}

class Player
{
    //Un joueur as des jetons
    var chips = [Chip]();
    // Un joueur a des cartes
    var cards = [Card]();
    // Nombre de points total des cartes
    var totalPoints: Int = 0;
    
    // Défini si c'est le croupier ou non
    var isCroupier: Bool = false;
    
    // Donne une carte du CardPack au joueur et l'ajoute à son Deck
    func GiveCard(cardToAdd: Card)
    {
        if(self.isCroupier && cards.count > 0)
        {
            cardToAdd.visible = false;
        }
        
        cards.append(cardToAdd);
        self.totalPoints += cardToAdd.realValue;
    }
    
    func PrintDeck()
    {
        for i in 0...cards.count-1
        {
            print("\(cards[i].value) de \(cards[i].color) (\(cards[i].realValue)) : \(cards[i].visible)");
        }
    }
}