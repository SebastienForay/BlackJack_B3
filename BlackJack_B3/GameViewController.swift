//
//  GameViewController.swift
//  BlackJack_B3
//
//  Created by Alexandre Giroud-Bit on 02/05/16.
//  Copyright (c) 2016 Alexandre Giroud-Bit. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController
{
    var nbPlayersInit: Int = 0;
    var canLaunchGame: Bool = false;
    
    @IBOutlet weak var txtNbPlayers: UITextField!
    @IBAction func txtNbPlayersTextChanged(sender: UITextField)
    {
        nbPlayersInit = Int(self.txtNbPlayers.text!)!;
        if(self.nbPlayersInit > 1 || self.nbPlayersInit < 8)
        {
            self.canLaunchGame = true;
        }
        else
        {
            self.canLaunchGame = false;
        }
    }
    
    @IBAction func LaunchGame(sender: UIButton)
    {
        if(self.canLaunchGame)
        {
            nbPlayersInit = Int(self.txtNbPlayers.text!)!;
        
            let deck = Deck(nbPlayers: nbPlayersInit);
        
            for i in 0...deck.numberOfPlayers
            {
                print("Player's \(i) Deck :");
                deck.players[i].GetDeck();
            }
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
    }
    
    override func shouldAutorotate() -> Bool {
        return true;
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true;
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return .All;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        // Release any cached data, images, etc that aren't in use.
    }

}
