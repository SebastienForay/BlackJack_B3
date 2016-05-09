//
//  Card.swift
//  BlackJack_B3
//
//  Created by Alexandre Giroud-Bit on 06/05/16.
//  Copyright © 2016 Alexandre Giroud-Bit. All rights reserved.
//

import Foundation

//Definition de la couleur d'une carte (Bleu et Rouge pour la séparation dans le talon)
enum Color: String {
    case Treffle = "Treffle"
    case Pic = "Pic"
    case Coeur = "Coeur"
    case Carreau = "Carreau"
    case Rouge = "Rouge"
    case Bleu = "Bleu"
}

class Card{
    //Couleur de la carte
    let color: Color;
    //Valeur (As, deux, trois ...)
    let value: Int;
    //True si la carte est visible des joueurs (retournée)
    var visible: Bool;
    init(color: Color, value: Int){
        self.color = color;
        self.value = value;
        self.visible = false;
    }
}