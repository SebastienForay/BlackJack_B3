//
//  BetManager.swift
//  BlackJack_B3
//
//  Created by Sébastien Foray on 14/05/2016.
//  Copyright © 2016 Alexandre Giroud-Bit. All rights reserved.
//

import Foundation

class Bet
{
    // Mise initiale
    var initialBet = [Chip]();
    // Contenu total de la mise du joueur
    var chipsInBet = [Chip]();
    // Définie si la mise est assurée ou non
    var isAssured: Bool = false;
    // Valeur payée pour l'assurance (1/2  mise initiale)
    var insuranceValue: Int = 0;
    // Contenu de l'assurance
    var insuranceContent = [Chip]();
    
    // Mise initiale
    func InitialBet(initBet: [Chip])
    {
        self.initialBet = initBet;
        self.AddToBet(self.initialBet);
    }
    // Jetons à ajouter à la mise
    func AddToBet(valueToAdd: [Chip])
    {
        // Si pas de mise initiale, ça la met
        if(self.initialBet.count == 0)
        {
            self.InitialBet(valueToAdd);
        }
        else
        {
            self.chipsInBet.appendContentsOf(valueToAdd);
        }
    }
    // Assure la mise en payant la moitié de la mise initiale
    //      retourne True si la mise est assurée et que ce que le joueur doit payer correspond à la bonne valeur
    // Déduire des jetons du joueur la valeur shouldPay après avoir reçu True, sinon refaire
    func CanAssure(shouldPay: Int) -> Bool
    {
        var retour: Bool = false;
        
        if(!self.isAssured && self.initialBet.count > 1)
        {
            for i in 0...self.chipsInBet.count
            {
                self.insuranceValue += self.initialBet[i].rawValue;
            }
            self.insuranceValue /= 2;
            
            if(self.insuranceValue == shouldPay)
            {
                retour = true;
            }
        }
        return retour;
    }
    // Paye l'assurance
    func PayInsurance(chipsToPay: [Chip])
    {
        self.insuranceContent.appendContentsOf(chipsToPay);
        self.isAssured = true;
    }
    // Renvoi le contenu de la mise
    func GetBetContent() -> [Chip]
    {
        return self.chipsInBet;
    }
    // Le joueur pert sa mise
    func Loose()
    {
        self.chipsInBet.removeAll();
    }
    // Le joueur perd son assurance
    func LoseInsurance()
    {
        self.insuranceContent.removeAll();
    }
}