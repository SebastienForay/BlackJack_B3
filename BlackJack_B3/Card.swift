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
    //Image de la carte
    let image: String;
    
    //True si la carte est visible des joueurs (retournée)
    var visible: Bool;
    
    init(color: Color, value: Int)
    {
        self.color = color;
        self.value = value;
        self.visible = true;
        
        //Image selector:
        var colorCode:String;
        var numberCode:String;
        switch color
        {
        case .Treffle:
            colorCode = "C";
        case .Coeur:
            colorCode = "H";
        case .Carreau:
            colorCode = "D";
        case .Pic:
            colorCode = "S";
        default:
            colorCode = color.rawValue;
        }
        switch value {
        case 1:
            numberCode = "A";
        case 10:
            numberCode = "0";
        case 11:
            numberCode = "J";
        case 12:
            numberCode = "Q";
        case 13:
            numberCode = "K";
        default:
            numberCode = String(value);
        }
        if(color != .Bleu || color != .Rouge){
            self.image = "http://deckofcardsapi.com/static/img/"+numberCode+colorCode+".png";
        }else{
            switch color {
            case .Bleu:
                self.image = "http://usercontent2.hubimg.com/6089769_f260.jpg";
            case .Rouge:
                self.image = "https://s3.amazonaws.com/ksr/assets/001/640/275/85ae4e674833c0b9454f6e9e651f94ff_large.jpg?1392530632";
            default:
                print("Error IMG initialisation");
                self.image = "";
            }
        }
        
        //Real Value selector
        switch(value)
        {
            // Du 10 au Roi, la carte est valorisée à 10 points
        case 10, 11, 12, 13:
            self.realValue = 10;
            // Toutes les autres sont valorisée à leur valeur nominale (du 1 au 9)
            // L'As pourra être valorisé à 11 points suivant les cas en jeu
        default:
            self.realValue = value;
        }
        
    }
}