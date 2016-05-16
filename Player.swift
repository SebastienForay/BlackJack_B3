//
//  Player.swift
//  BlackJack_B3
//
//  Created by Alexandre Giroud-Bit on 09/05/16.
//  Copyright © 2016 Alexandre Giroud-Bit. All rights reserved.
//

import Foundation

class Player
{
    // Un joueur a des cartes
    var cards = [Card]();
    // Un joueur peut miser
    var bet: Bet?;
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
            cardToAdd.image = "https://usercontent2.hubstatic.com/6089769_f260.jpg"
        }
        
        cards.append(cardToAdd);
        self.totalPoints += cardToAdd.realValue;
    }
    
    func GetDeck()
    {
        for i in 0...cards.count-1
        {
            if cards[i].visible
            {
                print("\(cards[i].value) de \(cards[i].color) (\(cards[i].realValue))");
            }
        }
    }
    // Renvoie la valeur réelle totale des cartes du joueur
    func GetCardsTotalValue() -> Int
    {
        var value: Int = 0;
        
        for c in self.cards
        {
            value += c.realValue;
        }
        
        return value;
    }
    // Créé une mise pour la partie
    func CreateBet(initialBet: Int)
    {
        self.bet = Bet(initBet: initialBet);
    }
    // Ajoute X de valeur à la mise en cours
    func AddToBet(valueToAdd: Int)
    {
        self.bet!.AddToBet(valueToAdd);
    }
    // Assure la mise en cours, renvoie True si l'assurance est passée sinon False
    func AssureBet() -> Bool
    {
        var retour: Bool = false;
        var shouldPay: Int = self.bet!.initialBet / 2;
        
        if(self.bet!.CanAssure(shouldPay))
        {
            retour = true;
            var chipsToPay: Int = 0;
            
            // Calcul et créé automatiquement ce que le joueur doit payer pour son assurance
            repeat
            {
                if(shouldPay % 20 == 0)
                {
                    chipsToPay += 20;
                    shouldPay -= 20;
                }
                else if(shouldPay % 10 == 0)
                {
                    chipsToPay += 10;
                    shouldPay -= 10;
                }
                else if(shouldPay % 5 == 0)
                {
                    chipsToPay += 5;
                    shouldPay -= 5;
                }
                else if(shouldPay % 2 == 0)
                {
                    chipsToPay += 2;
                    shouldPay -= 2;
                }
                else if(shouldPay % 1 == 0)
                {
                    chipsToPay += 1;
                    shouldPay -= 1;
                }
            }
            while shouldPay > 0;
            // Une fois fini, paye l'assurance
            self.bet!.PayInsurance(chipsToPay);
        }
        
        return retour;
    }
}