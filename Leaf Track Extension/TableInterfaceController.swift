//
//  TableInterfaceController.swift
//  hello-watchkit

import Foundation
import WatchKit

extension TableInterfaceController: DataServiceDelegate {
    func trucksLoaded() {
        
        OperationQueue.main.addOperation {
            //
        }
    }
    
}

class TableInterfaceController: WKInterfaceController {
  
    let minions = ["Jack Herer", "Jack Herer", "Jack Herer", "Jack Herer", "Jack Herer", "Jack Herer", "Jack Herer"]
  
  @IBOutlet weak var table: WKInterfaceTable!
  
    var dataService = DataService.instance
    
    var allLeafTruck = [LeafTruck]()
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        dataService.delegate = self
        dataService.getAllLeafTRucks()
        dataService.getAllLeafTrucksPrint()
    
    //Set number of rows and the class of the rows
    table.setNumberOfRows(minions.count, withRowType: "MinionRowType")
    
    //Loop through the rows of the table and populate them with data
        
    for (index, value) in minions.enumerated() {
      if let row = table.rowController(at: index) as? RowController {
        
        //Set the properties of the row Controller.
        row.minionNameLabel.setText(value)
        
      }
        
        //Scroll to last table row.
        table.scrollToRow(at: table.numberOfRows - 1)
        }
        
    }
}



