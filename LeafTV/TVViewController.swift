//
//  ViewController.swift
//  LeafTV
import UIKit

class TVViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataService = DataService.instance
    
    var allLeafTruck = [LeafTruck]()
    
    var customView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataService.delegate = self
        dataService.getAllLeafTRucks()
        
        tableView.delegate = self
        tableView.dataSource = self

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // TEST
        // dataService.getAllLeafTrucksPrint()
        // END TEST”
        
    }

    
    func showAlert(with title: String?, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
}

extension TVViewController: DataServiceDelegate {
    func trucksLoaded() {
        
        OperationQueue.main.addOperation {
            self.tableView.reloadData()
        }
    }
    
}

extension TVViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataService.leafTrucks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "tvtruckCell", for: indexPath) as? TVTableViewCell {
            cell.confifCell(truck: dataService.leafTrucks[indexPath.row])
            return cell
        } else {
            return UITableViewCell()
        }
    }
        
}


