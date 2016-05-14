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

class GameViewController: UIViewController, UITextFieldDelegate
{
    @IBOutlet weak var txtNbPlayers: UITextField!
    @IBOutlet weak var playButton: UIButton!
    
    
    var nbPlayersInit: Int = 0;
    var canLaunchGame: Bool = false;
    
    

    @IBAction func LaunchGame(sender: UIButton)
    {
        
        if let text = self.txtNbPlayers.text where !text.isEmpty
        {
            nbPlayersInit = Int(self.txtNbPlayers.text!)!;
            
            let deck = Deck(nbPlayers: nbPlayersInit);
            
            for i in 0...deck.numberOfPlayers
            {
                print("Player's \(i) Deck :");
                deck.players[i].GetDeck();
            }
   
        }else{
            let alert = UIAlertController(title: "Nombre invalide", message: "Vous avez rentré un nombre de joueur invalide", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    //On personnalise le champ de text pour n'accepter que les chiffres et afficher le bon clavier.
    override func viewDidLoad()
    {
        super.viewDidLoad();
        txtNbPlayers.delegate = self;
        txtNbPlayers.keyboardType = UIKeyboardType.NumberPad;
    }
    //Fonction pour ne prendre que les chiffres (delegate avec comparaison du charset src:http://stackoverflow.com/questions/26919854/how-can-i-declare-that-a-text-field-can-only-contain-an-integer
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        let aSet = NSCharacterSet(charactersInString:"0123456789").invertedSet
        let compSepByCharInSet = string.componentsSeparatedByCharactersInSet(aSet)
        let numberFiltered = compSepByCharInSet.joinWithSeparator("")
        return string == numberFiltered
        
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
