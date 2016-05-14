//
//  CardPack.swift
//  BlackJack_B3
//
//  Created by Alexandre Giroud-Bit on 06/05/16.
//  Copyright © 2016 Alexandre Giroud-Bit. All rights reserved.
//

import Foundation
import GameplayKit

class CardPack
{
    // Cartes du sabot
    var cards = [Card]();
    // Cartes brûlées
    var burnCards = [Card]();
    
    //A l'initialisation, nous remplissons un tableau avec 6 jeux de cartes et nous mélangons.
    //Nous devrons ensuite définir le talon.
    init()
    {
        //On ajoute 6 jeux de cartes.
        for _ in 1...6
        {
            self.cards.appendContentsOf(getOnePack());
        }
        //On mélange le tout 3 fois.
        for _ in 0...2
        {
            shuffleCardPack();
        }
    }
    
    // Fonction retournant une carte
    func GetFirstCard() -> Card
    {
        var cardToGive : Card;
        cardToGive = cards.first!;
        
        self.cards.removeAtIndex(0);
        
        return cardToGive;
    }
    
    //Fonction retournant un jeux de 52 cartes.
    func getOnePack()-> [Card]
    {
        var retour = [Card]();
        //Pour chaque couleur
        for i in 1...4
        {
            //Pour chaque valeur
            for j in 1...13
            {
                //En fonction de la couleur
                switch i
                {
                case 1:
                    retour.append(Card(color: Color.Carreau, value: j));
                case 2:
                    retour.append(Card(color: Color.Coeur, value: j));
                case 3:
                    retour.append(Card(color: Color.Pic, value: j));
                case 4:
                    retour.append(Card(color: Color.Treffle, value: j));
                    //Gestion Erreur
                default:
                    print("Error While loading cards (func -> getOnePack())");
                }
            }
        }
        
        return retour;
    }
    
    func shuffleCardPack(){
        //Utilisation de l'algorithme de Fisher-Yates impléménté dans GameplayKit
        self.cards = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(self.cards) as! [Card];
    }
    
    func setBlueCard(position: Int)  {
        if(0<position && position<312){
            self.cards.insert(Card(color: .Bleu, value: 0), atIndex: position)
            cutPack();
            //On ajoute la carte rouge
            self.cards.insert(Card(color: .Rouge, value: 0 ),atIndex: 300);
            //On Brule les 5 premières cartes
            for _ in 0...4{
                self.burnCards.append(self.cards.removeAtIndex(0));
            }
        }
    }
    //Coupe la tas à partir de la carte bleu
    func cutPack(){
        var blueEncountered: Bool = false;
        for i in 1...312{
            if(self.cards[i].color == Color.Bleu){
                blueEncountered = true;
            }
            else if(blueEncountered){
                self.cards.insert(self.cards.removeAtIndex(i), atIndex: 0);
            }
        }
    }
    //DEBUG
    func printSabot(){
        for c in self.cards {
            print(c.color.rawValue);
        }
    }
    
}