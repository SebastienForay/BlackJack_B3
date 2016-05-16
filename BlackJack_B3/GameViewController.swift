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
    @IBOutlet weak var txtBlueCard: UITextField!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var img: UIImageView!
    var bluecard:Int = 0;
    @IBAction func LaunchGame(sender: UIButton)
    {
        if let text = self.txtBlueCard.text where !text.isEmpty
        {
            //On cast le texte
            let blueCardPos = Int(text)!
            //On verifie que le nombre est bien dans le tas
            if(blueCardPos>0 && blueCardPos<312){
                self.bluecard = blueCardPos;
                performSegueWithIdentifier("ToDeck", sender: blueCardPos)
            }else{
                sendAlertNumber();
            }
        }else{
            sendAlertNumber();
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "ToDeck"){
            let secondViewController = segue.destinationViewController as! DeckViewController
            secondViewController.blueCard = bluecard;
        }
    }
    //Popup en cas d'erreur lors de la saisie de la position de la carte bleu.
    func sendAlertNumber(){
        let alert = UIAlertController(title: "Nombre invalide", message: "Vous avez rentré un nombre invalide", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        self.txtBlueCard.text = "";
    }
    //On personnalise le champ de text pour n'accepter que les chiffres et afficher le bon clavier.
    override func viewDidLoad()
    {
        super.viewDidLoad();
        txtBlueCard.delegate = self;
        txtBlueCard.keyboardType = UIKeyboardType.NumberPad;
        let url = NSURL(string: "http://deckofcardsapi.com/static/img/AS.png")
        let data = NSData(contentsOfURL: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
        self.img.image = UIImage(data: data!)
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
