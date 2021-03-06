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
    
    var money = 0
    var initialLemons = 0
    var iceCubes = 0
    var buyingLemons = 0
    var buyingIce = 0
    var lemonsInMix = 0
    var iceInMix = 0
    var lemonade = Lemonade()
    
    //array to contain the customers
    var customers:[Customer] = []

    
    
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
            showAlertWithText(header: "You don't have enough money left :(", message: "Get some ice instead?")
            //I think there needs to be a hard reset function here so that it starts the game again
        } else {
            initialLemons += 1 // the = is important
            money -= 2
            buyingLemons += 1
        }
        updateMainView()
    }
    
    @IBAction func buyFewerLemonsPressed(sender: UIButton) {
        //logic. if lemons = 0 alert else lemons - 1, money + 1
        if initialLemons == 0  {
            showAlertWithText(header: "Invalid action", message: "You don't have any lemons")
        } else {
            initialLemons -= 1
            money += 2
            buyingLemons -= 1
        }
        updateMainView()
        }
    
    @IBAction func buyMoreIcePressed(sender: UIButton) {
        if money < 1 {
            showAlertWithText(header: "You don't have enough money left :(", message: "Game Over")
        } else {
            iceCubes += 1
            money -= 1
            buyingIce += 1
            
        }
        updateMainView()
    }

    @IBAction func buyLessIcePressed(sender: UIButton) {
        if iceCubes == 0 {
            showAlertWithText(header: "Invalid action", message: "You don't have any ice")
        } else {
            iceCubes -= 1
            money += 1
            buyingIce -= 1
        }
        updateMainView()
    }
    
    //I'm not sure when these are supposed to update - is it when the button is pressed and the mixture is generated or what?
    
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
        
            availableLemonade()
            //need a function that will generate the list of customers and give all of them a preference
            //need a function (like a lemonade controller) that will evaluate preferences vs lemonade.acidity and see if there is a match
        
        createCustomers()
    }
    
    //function that updates the labels: needs to be called each time a button is pressed
    
    func updateMainView () {
        self.youHaveMoneyLabel.text = "$" + "\(money)"
        self.youHaveLemonsLabel.text = "\(initialLemons) lemons"
        self.youHaveIceCubesLabel.text = "\(iceCubes) ice cubes"
        self.purchaseIceCubesLabel.text = "\(buyingIce)"
        self.purchaseLemonsLabel.text = "\(buyingLemons)"
        self.mixLemonsLabel.text = "\(lemonsInMix)"
        self.mixIceCubesLabel.text = "\(iceInMix)"
    }
    
    func showAlertWithText (header : String = "Warning", message : String) {
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func initialSetUp () { //also needs to reset everything else - like all the labels
        money = 10
        initialLemons = 1
        iceCubes = 1
        buyingLemons = 0
        buyingIce = 0
        iceInMix = 0
        lemonsInMix = 0
        lemonade.acidity = 0
        // makes it reset all the labels
        updateMainView()
    }
    
    //this isn't going to work in the way that I want it to yet but it has the right logic
    func availableLemonade () {
        // needs to be converted into a double
        //the problem is right now that this is a local constant that isn't available anywhere else. I will need to do something about this later
        let lemonadeRatio:Double = Double(lemonsInMix) / Double(iceInMix) //this is not working because
        if lemonadeRatio < 1 {
            lemonade.acidity += 1 //this is the icy lemonade
        } else if lemonadeRatio == 1 {
            lemonade.acidity += 2 // this is the equal ice and lemon
        } else if lemonadeRatio > 1 {
            lemonade.acidity += 3 // this is the acidic lemonade
        }
        
        //using alerts instead of println()
        showAlertWithText(header: "\(lemonade.acidity)", message: "\(iceInMix)")
        
        //resets it back to the default values
        initialSetUp()
    }
    
    //what this function should do is create < 10 instances of Customer and put them in the customers array
    //I can't decide whether this is doing the right thing or not! the array doesn't appear to be emptying after each press, I will need to create some code to do that
    func createCustomers () {
        var randomNumberOfCustomers = Int(arc4random_uniform(UInt32(10)))
        for var todaysCustomers = 0; todaysCustomers <= randomNumberOfCustomers; ++todaysCustomers {
            var customer = Customer()
            //can I then call the instance function to generate the preference
            customers.append(customer)
            println("\(customers.count)")
        }
    }
    
}

