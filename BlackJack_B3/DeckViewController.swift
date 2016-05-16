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
    @IBAction func test(sender: AnyObject) {
        print("BLUE CARD ===\(self.blueCard)");
    }
    
    var blueCard:Int = 0;
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        print("BLUE CARD ===\(blueCard)");
        
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
