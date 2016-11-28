//
//  CheesseSelectionInterfaceController.swift
//  PizzaWatch
//
//  Created by Alejandro on 11/27/16.
//  Copyright © 2016 soltek. All rights reserved.
//

import WatchKit
import Foundation


class CheesseSelectionInterfaceController: WKInterfaceController {
    @IBOutlet var swicthMozzarellaOption: WKInterfaceSwitch!
    @IBOutlet var switchCheddarOption: WKInterfaceSwitch!
    @IBOutlet var switchParmesanOption: WKInterfaceSwitch!
    @IBOutlet var switchNoCheeseOption: WKInterfaceSwitch!
    var myPizza:Pizza!
    var nextControllerName:String = "IngredientsSelectionInterfaceController"

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // Configure interface objects here.
        myPizza = context as! Pizza
        
        if !myPizza.cheese.isEmpty {
            if myPizza.cheese == "Mozarela" {
                swicthMozzarellaOption.setOn(true)
            }
            else if myPizza.cheese == "Cheddar" {
                switchCheddarOption.setOn(true)
            }
            else if myPizza.cheese == "Parmesano" {
                switchParmesanOption.setOn(true)
            }
            else if myPizza.cheese == "Sin queso" {
                switchNoCheeseOption.setOn(true)
            }
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    // MARK: - Actions
    @IBAction func mozzarrellaAction(_ value: Bool) {
        if value {
            switchCheddarOption.setOn(false)
            switchParmesanOption.setOn(false)
            switchNoCheeseOption.setOn(false)
            myPizza.cheese = "Mozarela"
        }
        else {
            if myPizza.cheese == "Mozarela" {
                myPizza.cheese = ""
            }
        }
    }
    
    @IBAction func cheddarAction(_ value: Bool) {
        if value {
            swicthMozzarellaOption.setOn(false)
            switchParmesanOption.setOn(false)
            switchNoCheeseOption.setOn(false)
            myPizza.cheese = "Cheddar"
        }
        else {
            if myPizza.cheese == "Cheddar" {
                myPizza.cheese = ""
            }
        }
    }
    
    @IBAction func parmesanAction(_ value: Bool) {
        if value {
            swicthMozzarellaOption.setOn(false)
            switchCheddarOption.setOn(false)
            switchNoCheeseOption.setOn(false)
            myPizza.cheese = "Parmesano"
        }
        else {
            if myPizza.cheese == "Parmesano" {
                myPizza.cheese = ""
            }
        }
    }
    
    @IBAction func noCheeseAction(_ value: Bool) {
        if value {
            swicthMozzarellaOption.setOn(false)
            switchCheddarOption.setOn(false)
            switchParmesanOption.setOn(false)
            myPizza.cheese = "Sin queso"
        }
        else {
            if myPizza.cheese == "Sin queso" {
                myPizza.cheese = ""
            }
        }
    }
    
    @IBAction func continueAction() {
        if myPizza.cheese.isEmpty {
            let action = WKAlertAction(title: "Ok",
                                       style: WKAlertActionStyle.default,
                                       handler:{});
            self.presentAlert(withTitle: "Sorry :(",
                              message: "Necesitas seleccionar el tipo de queso para tu pizza",
                              preferredStyle: .alert,
                              actions: [action])
        }
        else {
            pushController(withName: nextControllerName, context: myPizza)
        }
    }
}
