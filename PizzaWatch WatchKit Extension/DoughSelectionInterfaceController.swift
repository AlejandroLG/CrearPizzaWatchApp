//
//  DoughSelectionInterfaceController.swift
//  PizzaWatch
//
//  Created by Alejandro on 11/27/16.
//  Copyright © 2016 soltek. All rights reserved.
//

import WatchKit
import Foundation


class DoughSelectionInterfaceController: WKInterfaceController {
    @IBOutlet var switchSlimOption: WKInterfaceSwitch!
    @IBOutlet var switchCrunchyOption: WKInterfaceSwitch!
    @IBOutlet var switchGrossOption: WKInterfaceSwitch!
    var myPizza:Pizza!
    var nextControllerName:String = "CheesseSelectionInterfaceController"

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // Configure interface objects here.
        myPizza = context as! Pizza

        if !myPizza.dough.isEmpty {
            if myPizza.dough == "Delgada" {
                switchSlimOption.setOn(true)
            }
            else if myPizza.dough == "Crujiente" {
                switchCrunchyOption.setOn(true)
            }
            else if myPizza.dough == "Gruesa" {
                switchGrossOption.setOn(true)
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
    @IBAction func slimAction(_ value: Bool) {
        if value {
            switchCrunchyOption.setOn(false)
            switchGrossOption.setOn(false)
            myPizza.dough = "Delgada"
        }
        else {
            if myPizza.dough == "Delgada" {
                myPizza.dough = ""
            }
        }
    }
    
    @IBAction func crunchyAction(_ value: Bool) {
        if value {
            switchSlimOption.setOn(false)
            switchGrossOption.setOn(false)
            myPizza.dough = "Crujiente"
        }
        else {
            if myPizza.dough == "Crujiente" {
                myPizza.dough = ""
            }
        }
    }
    
    @IBAction func grossAction(_ value: Bool) {
        if value {
            switchSlimOption.setOn(false)
            switchCrunchyOption.setOn(false)
            myPizza.dough = "Gruesa"
        }
        else {
            if myPizza.dough == "Gruesa" {
                myPizza.dough = ""
            }
        }
    }
    
    @IBAction func continueAction() {
        if myPizza.dough.isEmpty {
            let action = WKAlertAction(title: "Ok",
                                       style: WKAlertActionStyle.default,
                                       handler:{});
            self.presentAlert(withTitle: "Sorry :(",
                              message: "Necesitas seleccionar el tipo de masa de tu pizza",
                              preferredStyle: .alert,
                              actions: [action])
        }
        else {
            pushController(withName: nextControllerName, context: myPizza)
        }
    }
}
