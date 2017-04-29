//
//  CompanyService.swift
//  GreenleafNetworkBaltimore

import Foundation

protocol CompanyServiceDelegate: class {
    func companiesLoaded()
}

class CompanyService {
    
    static let instance = CompanyService()
    
    weak var delegate: CompanyServiceDelegate?

    var leafCompanies = [CompanyModel]()
    var leafCompany = CompanyModel()
    
    // GET All getAllCompanies
    func getAllLeafCompanies(){
        let sessionConfig = URLSessionConfiguration.default
        
        // Create session, and optionally set URLSessionDelegate
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        //Create the request
        guard let URL = URL(string: COMPANY_API_URL) else { return }
        var request = URLRequest(url: URL)
        request.httpMethod = "GET"
        
        
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) in
            if(error == nil){
                // Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
                print("getAllCompanies called")
                
                if let data = data{
                    self.leafCompanies = CompanyModel.parseCompanysJSONData(data: data)
                    self.delegate?.companiesLoaded()
                }
            } else {
                print("URL Session Task Failed: \(error!.localizedDescription)")
            }
            
        })
        task.resume()
        session.finishTasksAndInvalidate()
    }
    
    // GET All leaf trucks
    func getAllLeafCompaniesPrint() -> Void {
        let sessionConfig = URLSessionConfiguration.default
        
        // Create session, and optionally set URLSessionDelegate
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        //Create the request
        guard let URL = URL(string: COMPANY_API_URL) else { return }
        var request = URLRequest(url: URL)
        request.httpMethod = "GET"
        
        
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) in
            if(error == nil){
                // Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
                
                for element in self.leafCompanies {
                    print("name \(element.name)")
                    print("ucpc \(element.ucpc)")
                    
                }
                
                if let data = data{
                    self.leafCompanies = CompanyModel.parseCompanysJSONData(data: data)
                    self.delegate?.companiesLoaded()
                    
                }
                
            } else {
                print("URL Session Task Failed: \(error!.localizedDescription)")
            }
            
        })
        task.resume()
        session.finishTasksAndInvalidate()
    }
    
}
