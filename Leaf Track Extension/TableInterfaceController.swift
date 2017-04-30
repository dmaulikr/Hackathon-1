//
//  TableInterfaceController.swift
//  hello-watchkit

import Foundation
import WatchKit

class TableInterfaceController: WKInterfaceController {
  
    let minions = ["Jack Herer", "Jack Herer", "Jack Herer", "Jack Herer", "Jack Herer", "Jack Herer", "Jack Herer"]
  
  @IBOutlet weak var table: WKInterfaceTable!
    
    var allLeafTruck = [LeafTruck]()
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        urlGet()
      
        setupTable()
        print(allLeafTruck)
        
    }
    
    func setupTable() {
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

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        NSLog("%@ will activate", self)
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        NSLog("%@ did deactivate", self)
        super.didDeactivate()
    }
    
    func urlGet() {
        
        let postEndpoint: String = "https://www.cannabisreports.com/api/v1.0/strains/VUJCJ4TYMG000000000000000/availability/geo/37.7749295/-122.4194155/10"
        
        // The guard statement lets us check that the URL we’ve provided is valid.
        guard let url = URL(string: postEndpoint) else {
            print("Error: cannot create URL")
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        // NSURLSession to use to send the request
        let session = URLSession.shared
        
        // create the data task
        let task = session.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            
            // parse the result as JSON, since that's what the API provides
            do {
                guard let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: AnyObject] else {
                    print("error trying to convert data to JSON")
                    return
                }
                
                
                let trucks = json["data"] as? [[String: AnyObject]]
                    
                    for truck in trucks! {
                        
                        let newLeaf = LeafTruck()
                        newLeaf.name = truck["name"] as! String
                        
                        self.allLeafTruck.append(newLeaf)
                    }
                
                
                
            } catch  {
                print("error trying to convert data to JSON")
                return
            }
    
        })
        
        task.resume()
    }
    
    
}



