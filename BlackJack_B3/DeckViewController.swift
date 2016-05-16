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

class DeckViewController: UIViewController
{
    var blueCard:Int = 0;
    var game: Game? = nil;
    
    @IBOutlet weak var un: UIButton!
    @IBOutlet weak var deux: UIButton!
    @IBOutlet weak var cinq: UIButton!
    @IBOutlet weak var dix: UIButton!
    @IBAction func Play(sender: AnyObject) {
        launchGame();
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        //print("BLUE CARD ===\(blueCard)");
        //On crée la partie avec la position de la carte bleu dans le tas
    }
    func launchGame(){
        var game = Game(cardPos: blueCard, view: self);
        game.Play();
    }
    func miser(){
        
    }
    
    func assurer(){
        let alert = UIAlertController(title: "Assurer", message: "Voulez vous assurer le tour ?", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Oui", style: UIAlertActionStyle.Default, handler: { (action: UIAlertAction!) in
            //TODO verifier que je n'ai pas fais de la merde !!
            self.game?.player?.AssureBet();
        }));
        alert.addAction(UIAlertAction(title: "Non", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
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
