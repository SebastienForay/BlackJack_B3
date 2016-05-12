//
//  Card.swift
//  BlackJack_B3
//
//  Created by Alexandre Giroud-Bit on 06/05/16.
//  Copyright © 2016 Alexandre Giroud-Bit. All rights reserved.
//

import Foundation

//Definition de la couleur d'une carte (Bleu et Rouge pour la séparation dans le talon)
enum Color: String
{
    case Treffle = "Treffle"
    case Pic = "Pic"
    case Coeur = "Coeur"
    case Carreau = "Carreau"
    case Rouge = "Rouge"
    case Bleu = "Bleu"
}

class Card
{
    //Couleur de la carte
    let color: Color;
    //Valeur (As, deux, trois ...)
    let value: Int;
    //Valeur réel de la carte
    let realValue: Int;
    
    //True si la carte est visible des joueurs (retournée)
    var visible: Bool;
    
    init(color: Color, value: Int)
    {
        self.color = color;
        self.value = value;
        self.visible = true;
        
        switch(value)
        {
            // L'As est valorisé à 11 points
        case 1:
            self.realValue = 11;
            // Du 10 au Roi, la carte est valorisée à 10 points
        case 10, 11, 12, 13:
            self.realValue = 10;
            // Toutes les autres sont valorisée à leur valeur nominale (du 2 au 9)
        default:
            self.realValue = value;
        }
        
    }
}