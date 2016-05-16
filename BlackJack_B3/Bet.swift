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
    var initialBet: Int = 0;
    // Valeur totale de la mise du joueur
    var totalBetValue: Int = 0;
    // Définie si la mise est assurée ou non
    var isAssured: Bool = false;
    // Valeur payée pour l'assurance (1/2  mise initiale)
    var insuranceValue: Int = 0;
    // Définie si l'assurance est payé ou non
    var isInsurancePayed: Bool = false;
    
    init(initBet: Int)
    {
        self.initialBet = initBet;
        self.AddToBet(self.initialBet);
    }
    // Valeur à ajouter à la mise
    func AddToBet(valueToAdd: Int)
    {
        // Si pas de mise initiale, ça la met
        if(self.initialBet == 0)
        {
            self.initialBet = valueToAdd;
        }
        // Sinon ça ajoute
        else
        {
            self.totalBetValue += valueToAdd;
        }
    }
    // Assure la mise en payant la moitié de la mise initiale
    //      retourne True si la mise est assurée et que ce que le joueur doit payer correspond à la bonne valeur
    // Déduire des jetons du joueur la valeur shouldPay après avoir reçu True, sinon refaire
    func CanAssure(shouldPay: Int) -> Bool
    {
        var retour: Bool = false;
        
        // Si pas assuré, pas payé et mise initiale supérieure à 1
        if(!self.isAssured && !self.isInsurancePayed && self.initialBet > 1)
        {
            self.insuranceValue = self.initialBet / 2;
            
            if(self.insuranceValue == shouldPay)
            {
                retour = true;
            }
        }
        return retour;
    }
    // Paye l'assurance
    func PayInsurance(valueToPay: Int)
    {
        self.isAssured = true;
        self.isInsurancePayed = true;
    }
}