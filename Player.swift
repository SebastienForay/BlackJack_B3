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
    case Bleu = 1
    case Vert = 2
    case Rouge = 5
    case Blanc = 10
    case Noir = 20
}

class Player
{
    //Un joueur as des jetons
    var chips = [Chip]();
    // Un joueur a des cartes
    var cards = [Card]();
    // Un joueur peut miser
    var bet = Bet();
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
    
    func CreateBet(initBet: [Chip])
    {
        self.bet.InitialBet(initBet);
    }
    func AddToBet(chipsToAdd: [Chip])
    {
        self.bet.AddToBet(chipsToAdd);
    }
    func AssureBet() -> Bool
    {
        var retour: Bool = false;
        var shouldPay: Int = 0;
        for i in 0...self.bet.initialBet.count
        {
            shouldPay += self.bet.initialBet[i].rawValue;
        }
        shouldPay /= 2;
        
        if(self.bet.CanAssure(shouldPay))
        {
            retour = true;
            var chipsToPay = [Chip]();
            
            // Calcul et créé automatiquement ce que le joueur doit payer pour son assurance
            // TODO : Retirer ce qui est payé des jetons du joueur
            repeat
            {
                var chipToAdd: Chip;
                
                if(shouldPay % 20 == 0)
                {
                    chipToAdd = Chip(rawValue: 20)!;
                    chipsToPay.append(chipToAdd);
                    shouldPay -= 20;
                }
                else if(shouldPay % 10 == 0)
                {
                    chipToAdd = Chip(rawValue: 10)!;
                    chipsToPay.append(chipToAdd);
                    shouldPay -= 10;
                }
                else if(shouldPay % 5 == 0)
                {
                    chipToAdd = Chip(rawValue: 5)!;
                    chipsToPay.append(chipToAdd);
                    shouldPay -= 5;
                }
                else if(shouldPay % 2 == 0)
                {
                    chipToAdd = Chip(rawValue: 2)!;
                    chipsToPay.append(chipToAdd);
                    shouldPay -= 2;
                }
                else if(shouldPay % 1 == 0)
                {
                    chipToAdd = Chip(rawValue: 1)!;
                    chipsToPay.append(chipToAdd);
                    shouldPay -= 1;
                }
            }
            while shouldPay > 0;
            // Une fois fini, paye l'assurance
            self.bet.PayInsurance(chipsToPay);
        }
        
        return retour;
    }
}