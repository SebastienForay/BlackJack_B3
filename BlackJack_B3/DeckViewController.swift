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
    
    @IBOutlet weak var playerCard1: UIImageView!
    @IBOutlet weak var playerCard2: UIImageView!
    @IBOutlet weak var playerCard3: UIImageView!
    @IBOutlet weak var playerCard4: UIImageView!
    @IBOutlet weak var playerCard5: UIImageView!
    
    @IBOutlet weak var croupierCard1: UIImageView!
    @IBOutlet weak var croupierCard2: UIImageView!
    @IBOutlet weak var croupierCard3: UIImageView!
    @IBOutlet weak var croupierCard4: UIImageView!
    @IBOutlet weak var croupierCard5: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        self.game = Game(cardPos: blueCard, view: self);
        
        game!.InitGame();
        self.playerCard1.image = UIImage(data: NSData(contentsOfURL: NSURL(string: self.game!.player!.cards[0].image)!)!)
        self.playerCard2.image = UIImage(data: NSData(contentsOfURL: NSURL(string: self.game!.player!.cards[1].image)!)!)
        
        self.croupierCard1.image = UIImage(data: NSData(contentsOfURL: NSURL(string: self.game!.croupier!.cards[0].image)!)!)
        self.croupierCard2.image = UIImage(data: NSData(contentsOfURL: NSURL(string: self.game!.croupier!.cards[1].image)!)!)
    }
    func launchGame(){
        game!.Play();
    }
    func miser(){
        //self.game = Game(cardPos: blueCard, view: self);
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
