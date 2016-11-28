//
//  IngredientsSelectionInterfaceController.swift
//  PizzaWatch
//
//  Created by Alejandro on 11/27/16.
//  Copyright © 2016 soltek. All rights reserved.
//

import WatchKit
import Foundation


class IngredientsSelectionInterfaceController: WKInterfaceController {
    @IBOutlet var tableIngredients: WKInterfaceTable!
    var myPizza:Pizza!
    var ingredientsList:Array = ["Jamón", "Pepperoni", "Pavo", "Salchicha", "Aceituna", "Cebolla", "Pimiento", "Anchoa"]
    var nextControllerName = "ConfirmationInterfaceController"

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        myPizza = context as! Pizza
        initilizeTable()
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func initilizeTable() {
        tableIngredients.setNumberOfRows(ingredientsList.count, withRowType: "IngredientRow")
        for index in 0 ..< ingredientsList.count {
            let row = tableIngredients.rowController(at: index) as! IngredientRow
            row.ingredientLabel.setText(ingredientsList[index])
            if myPizza.ingredients.contains(ingredientsList[index]) {
                row.rowGroup.setBackgroundColor(UIColor.orange)
            }
            else {
                row.rowGroup.setBackgroundColor(UIColor.darkGray)
            }
        }
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        let row = tableIngredients.rowController(at: rowIndex) as! IngredientRow
        if myPizza.ingredients.contains(ingredientsList[rowIndex]) {
            row.rowGroup.setBackgroundColor(UIColor.darkGray)
            myPizza.ingredients.remove(ingredientsList[rowIndex])
        }
        else {
            row.rowGroup.setBackgroundColor(UIColor.orange)
            myPizza.ingredients.add(ingredientsList[rowIndex])
        }
    }
    
    @IBAction func finishAction() {
        if myPizza.ingredients.count > 0 {
            pushController(withName: nextControllerName, context: myPizza)
        }
        else {
            let action = WKAlertAction(title: "Ok",
                                       style: WKAlertActionStyle.default,
                                       handler:{});
            self.presentAlert(withTitle: "Sorry :(",
                              message: "Necesitas seleccionar al menos 1 ingrediente",
                              preferredStyle: .alert,
                              actions: [action])
        }
    }
}
