//
//  SizeSelectionInterfaceController.swift
//  PizzaWatch WatchKit Extension
//
//  Created by Alejandro on 11/27/16.
//  Copyright © 2016 soltek. All rights reserved.
//

import WatchKit
import Foundation


class SizeSelectionInterfaceController: WKInterfaceController {
    @IBOutlet var switchSmallSize: WKInterfaceSwitch!
    @IBOutlet var switchMediumSize: WKInterfaceSwitch!
    @IBOutlet var switchBigSize: WKInterfaceSwitch!
    var myPizza:Pizza! = Pizza()
    var nextControllerName:String = "DoughSelectionInterfaceController"

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // Configure interface objects here.        
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
    @IBAction func smallSelectionAction(_ value: Bool) {
        if value {
            switchMediumSize.setOn(false)
            switchBigSize.setOn(false)
            myPizza.size = "Chica"
        }
        else {
            if (myPizza.size == "Chica") {
                myPizza.size = ""
            }
        }
    }
    
    @IBAction func mediumSelectionAction(_ value: Bool) {
        if value {
            switchSmallSize.setOn(false)
            switchBigSize.setOn(false)
            myPizza.size = "Mediana"
        }
        else {
            if (myPizza.size == "Mediana") {
                myPizza.size = ""
            }
        }
    }
    
    @IBAction func bigSelectionAction(_ value: Bool) {
        if value {
            switchSmallSize.setOn(false)
            switchMediumSize.setOn(false)
            myPizza.size = "Grande"
        }
        else {
            if (myPizza.size == "Grande") {
                myPizza.size = ""
            }
        }
    }
    
    @IBAction func continueAction() {
        if myPizza.size.isEmpty {
            let action = WKAlertAction(title: "Ok",
                                       style: WKAlertActionStyle.default,
                                       handler:{});
            self.presentAlert(withTitle: "Sorry :(",
                              message: "Necesitas seleccionar el tamaño de tu pizza",
                              preferredStyle: .alert,
                              actions: [action])
        }
        else {
            pushController(withName: nextControllerName, context: myPizza)

        }
    }
}
