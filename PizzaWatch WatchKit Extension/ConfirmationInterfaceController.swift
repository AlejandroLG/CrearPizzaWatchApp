//
//  ConfirmationInterfaceController.swift
//  PizzaWatch
//
//  Created by Alejandro on 11/27/16.
//  Copyright © 2016 soltek. All rights reserved.
//

import WatchKit
import Foundation


class ConfirmationInterfaceController: WKInterfaceController {
    var myPizza:Pizza!
    @IBOutlet var tablePizzaDetail: WKInterfaceTable!

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // Configure interface objects here.
        myPizza = context as! Pizza
        showPizzaDetail()
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func showPizzaDetail() {
        var title:String!, subtitle:String!
        tablePizzaDetail.setNumberOfRows(4, withRowType: "PizzaDetailRow")
        for index in 0 ..< 4 {
            if (index == 0) {
                title = "Tamaño"
                subtitle = myPizza.size
            }
            else if (index == 1) {
                title = "Masa"
                subtitle = myPizza.dough
            }
            else if (index == 2) {
                title = "Queso"
                subtitle = myPizza.cheese
            }
            else {
                let ingredients:NSMutableString = NSMutableString()
                for ingredient in myPizza.ingredients {
                    ingredients.appendFormat("%@ ", ingredient as! CVarArg)
                }
                title = "Ingredientes"
                subtitle = ingredients as String!
            }
            
            let row = tablePizzaDetail.rowController(at: index) as! PizzaDetailRow
            row.titleLabel.setText(title)
            row.subtitle.setText(subtitle)
        }
    }

    @IBAction func confirmAction() {
        let action = WKAlertAction(title: "Ok",
                                   style: WKAlertActionStyle.default,
                                   handler:{
                                    self.popToRootController()
        });
        self.presentAlert(withTitle: "Yeah!!",
                          message: "Tu pizza estará lista en unos momentos",
                          preferredStyle: .alert,
                          actions: [action])
    }
}
