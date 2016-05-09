//
//  Player.swift
//  BlackJack_B3
//
//  Created by Alexandre Giroud-Bit on 09/05/16.
//  Copyright © 2016 Alexandre Giroud-Bit. All rights reserved.
//

import Foundation

//Jetons (rawValue = valeur du jeton)
enum Chip: Int {
    case Blanc = 1
    case Rouge = 5
    case Vert = 25
    case Noir = 100
}

class Player{
    //Un joueur as des jetons
    var chips = [Chip]();
}