//
//  DataService.swift
//  GreenleafNetworkBaltimore

import Foundation

protocol DataServiceDelegate: class {
    func trucksLoaded()
}

class DataService {
    
    static let instance = DataService()
    
    weak var delegate: DataServiceDelegate?
    var leafTrucks = [LeafTruck]()
    var leafTruck = LeafTruck()
    
    // GET All food trucks
    func getAllLeafTRucks(){
        let sessionConfig = URLSessionConfiguration.default
        
        // Create session, and optionally set URLSessionDelegate
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        //Create the request
        guard let URL = URL(string: BASE_API_URL) else { return }
        var request = URLRequest(url: URL)
        request.httpMethod = "GET"
        
        
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) in
            if(error == nil){
                // Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
                print("getAllLeafTRucks called")
                
                if let data = data{
                    self.leafTrucks = LeafTruck.parseFoodTrucksJSONData(data: data)
                    self.delegate?.trucksLoaded()
                }
            } else {
                print("URL Session Task Failed: \(error!.localizedDescription)")
            }
            
        })
        task.resume()
        session.finishTasksAndInvalidate()
    }
        
    // GET All leaf trucks
    func getAllLeafTrucksPrint() -> Void {
        let sessionConfig = URLSessionConfiguration.default
        
        // Create session, and optionally set URLSessionDelegate
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        //Create the request
        guard let URL = URL(string: BASE_API_URL) else { return }
        var request = URLRequest(url: URL)
        request.httpMethod = "GET"
        
        
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) in
            if(error == nil){
                // Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
                
                for element in self.leafTrucks {
                    print("name \(element.name)")
                    print("avgCost \(element.price_gram)")
                    print("foodType \(element.leafType)")
                    
                }
                
                if let data = data{
                    self.leafTrucks = LeafTruck.parseFoodTrucksJSONData(data: data)
                    self.delegate?.trucksLoaded()
                    
                }
                
            } else {
                print("URL Session Task Failed: \(error!.localizedDescription)")
            }
            
        })
        task.resume()
        session.finishTasksAndInvalidate()
    }
    
}
