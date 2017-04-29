//
//  LeafModel.swift
//  GreenleafNetworkBaltimore
//  https://developers.cannabisreports.com/docs/strains-ucpc-genetics

import Foundation

public class LeafTruck: NSObject {
    
    var name: String = ""
    var leafType: String = ""
    var price_gram: String = ""

    static func parseFoodTrucksJSONData(data: Data) -> [LeafTruck] {
        var leaftrucks = [LeafTruck]()
        
        do {
            if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                let trucks = json["data"] as? [[String: Any]] {

                for truck in trucks {
                    
                    let newLeaf = LeafTruck()
                    newLeaf.name = truck["name"] as! String
                    newLeaf.leafType = truck["type"] as! String
                    newLeaf.price_gram = truck["price_gram"] as! String
                    
                    
                    leaftrucks.append(newLeaf)
                }
            }
            
        } catch let err {
            print(err)
        }
        
        return leaftrucks
    }
    
    static func parseFoodTruckJSONData(data: Data) -> LeafTruck {
        var leafTruck = LeafTruck()
        
        do {
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            
            // Parse JSON Data
            if let truck = jsonResult as? Dictionary<String, AnyObject>{
                
                let newLeafTruck = LeafTruck()
                
                newLeafTruck.name = truck["name"]! as! String
                newLeafTruck.leafType = truck["type"]! as! String
                newLeafTruck.price_gram = truck["price_gram"]! as! String
                

                leafTruck = newLeafTruck
            }
            
        } catch let err {
            print(err)
        }
        
        return leafTruck
    }

}
