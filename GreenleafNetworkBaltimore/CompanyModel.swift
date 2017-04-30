//
//  CompanyModel.swift
//  GreenleafNetworkBaltimore

import Foundation

public class CompanyModel: NSObject {
    
    var name: String = ""
    var ucpc: String = ""
    var producer: String = ""
    var type: String = ""

    static func parseCompanysJSONData(data: Data) -> [CompanyModel] {
        var leaftrucks = [CompanyModel]()
        
        do {
            if let json = try JSONSerialization.jsonObject(with: data) as? [String: AnyObject],
                let trucks = json["data"] as? [[String: AnyObject]] {
                
                for truck in trucks {
                    
                    let newLeaf = CompanyModel()
                    newLeaf.name = truck["name"] as! String
                    newLeaf.ucpc = truck["ucpc"] as! String
                    newLeaf.producer = truck["producer"]?["name"]  as! String
                    newLeaf.type = truck["type"] as! String

                    leaftrucks.append(newLeaf)
                }
            }
            
        } catch let err {
            print(err)
        }
        
        return leaftrucks
    }
    
}
