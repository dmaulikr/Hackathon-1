//
//  InterfaceController.swift
//  Leaf Track Extension

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {
    
    var dataService = DataService.instance
    
    var allLeafTruck = [LeafTruck]()
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        dataService.getAllLeafTrucksPrint()
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
