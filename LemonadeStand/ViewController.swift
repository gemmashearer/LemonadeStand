//
//  ViewController.swift
//  LemonadeStand
//
//  Created by Gemma Shearer on 10/06/2015.
//  Copyright (c) 2015 GemmaShearer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //connections for the lables so that these can be changed dynamically
    
    @IBOutlet weak var youHaveMoneyLabel: UILabel! //I need to figure out how to get the var to update for all of these
    @IBOutlet weak var youHaveLemonsLabel: UILabel!
    @IBOutlet weak var youHaveIceCubesLabel: UILabel!
    @IBOutlet weak var purchaseLemonsLabel: UILabel!
    @IBOutlet weak var purchaseIceCubesLabel: UILabel!
    @IBOutlet weak var mixLemonsLabel: UILabel!
    @IBOutlet weak var mixIceCubesLabel: UILabel!
    
    //Connections for buttons are under didReceiveMemoryWarning
    
    //declaring everything that the player has at the start
    var money = 0
    var initialLemons = 0
    var iceCubes = 0
    
    //variables for mixture
    
    var lemonsInMix = 0
    var iceInMix = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initialSetUp()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //functions for when buttons are pressed

    @IBAction func buyMoreLemonsPressed(sender: UIButton) {
        
        if money < 2 {
            showAlertWithText(header: "You don't have enough money left :(", message: "Game Over")
            //I think there needs to be a hard reset function here so that it starts the game again
        } else {
            initialLemons += 1 // the = is important
            money -= 2
            updateMainView()
        }
    }
    
    @IBAction func buyFewerLemonsPressed(sender: UIButton) {
        //logic. if lemons = 0 alert else lemons - 1, money + 1
        if initialLemons == 0  {
            showAlertWithText(header: "Invalid action", message: "You don't have any lemons")
        } else {
            initialLemons -= 1
            money += 2
        }
        updateMainView()
        }
    
    @IBAction func buyMoreIcePressed(sender: UIButton) {
        if money < 1 {
            showAlertWithText(header: "You don't have enough money left :(", message: "Game Over")
        } else {
            iceCubes += 1
            money -= 1
        }
        updateMainView()
    }

    @IBAction func buyLessIcePressed(sender: UIButton) {
        if iceCubes == 0 {
            showAlertWithText(header: "Invalid action", message: "You don't have any ice")
        } else {
            iceCubes -= 1
            money += 1
        }
        updateMainView()
    }
    
    
    @IBAction func mixMoreLemonsPressed(sender: UIButton) {
        //logic lemons at the top - 1
        // lable updated to show extra lemon
        if initialLemons >= 1 {
            initialLemons -= 1
            lemonsInMix += 1
        } else {
            showAlertWithText(header: "You don't have enough money left :(", message: "Game Over")
        }
    
        updateMainView()
    }
    
    @IBAction func mixFewerLemonsPressed(sender: UIButton) {
        //logic lemons at the top + 1
        //label for lemons in the mixture
        if lemonsInMix == 0 {
            showAlertWithText(header: "Invalid action", message: "You don't have any lemons")
        } else {
            lemonsInMix -= 1
            initialLemons += 1
        }
        updateMainView()
    }
    
    @IBAction func mixMoreIcePressed(sender: UIButton) {
        if iceCubes >= 1 {
            iceCubes -= 1
            iceInMix += 1
        } else {
            showAlertWithText(header: "Invalid action", message: "You don't have any ice left")
        }
        updateMainView()
    }
    
    @IBAction func mixLessIcePressed(sender: UIButton) {
        if iceInMix == 0 {
            showAlertWithText(header: "Invalid action", message: "You don't have any ice left")
        }
        else {
            iceInMix -= 1
            iceCubes += 1
        }
        updateMainView()
    }
    
    
    @IBAction func startButtonPressed(sender: UIButton) {
        //reset to the default values - this bit works
        initialSetUp()
    }
    
    //function that updates the labels: needs to be called each time a button is pressed
    
    func updateMainView () {
        self.youHaveMoneyLabel.text = "$" + "\(money)"
        self.youHaveLemonsLabel.text = "\(initialLemons) lemons" //need to decide what variable will go in here
        self.youHaveIceCubesLabel.text = "\(iceCubes) ice cubes" // need to decide what variable wil go in here
        self.mixLemonsLabel.text = "\(lemonsInMix)"
        self.mixIceCubesLabel.text = "\(iceInMix)"
    }
    
    func showAlertWithText (header : String = "Warning", message : String) {
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func initialSetUp () { //also needs to reset everything else
        money = 10
        initialLemons = 1
        iceCubes = 1
        self.youHaveMoneyLabel.text = "$" + "\(money)"
        self.youHaveLemonsLabel.text = "\(initialLemons) lemons" //need to decide what variable will go in here
        self.youHaveIceCubesLabel.text = "\(iceCubes) ice cubes" // need to decide what variable wil go in here
        //add more properties here to change the labels in the mixture once these have been set up
    }
    
}

