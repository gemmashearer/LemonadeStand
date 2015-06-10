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
    
    @IBOutlet weak var youHaveMoneyLabel: UILabel!
    @IBOutlet weak var youHaveLemonsLabel: UILabel!
    @IBOutlet weak var youHaveIceCubesLabel: UILabel!
    @IBOutlet weak var purchaseLemonsLabel: UILabel!
    @IBOutlet weak var purchaseIceCubesLabel: UILabel!
    @IBOutlet weak var mixLemonsLabel: UILabel!
    @IBOutlet weak var mixIceCubesLabel: UILabel!
    
    //Connections for buttons are under didReceiveMemoryWarning
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buyMoreLemonsPressed(sender: UIButton) {
    }
    
    @IBAction func buyFewerLemonsPressed(sender: UIButton) {
    }
    
    @IBAction func buyMoreIcePressed(sender: UIButton) {
    }

    @IBAction func buyLessIcePressed(sender: UIButton) {
    }
    
    
    @IBAction func mixMoreLemonsPressed(sender: UIButton) {
    }
    
    @IBAction func mixFewerLemonsPressed(sender: UIButton) {
    }
    
    @IBAction func mixMoreIcePressed(sender: UIButton) {
    }
    
    @IBAction func mixLessIcePressed(sender: UIButton) {
    }
    
    
    @IBAction func startButtonPressed(sender: UIButton) {
    }
    
}

