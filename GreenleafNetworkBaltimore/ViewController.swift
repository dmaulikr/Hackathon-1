//
//  ViewController.swift
//  GreenleafNetworkBaltimore

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var dataService = DataService.instance
    
    var allLeafTruck = [LeafTruck]()
    let theme = ThemeManager.currentTheme()

    var refreshControl: UIRefreshControl!
    var customView: UIView!
    var labelsArray: Array<UILabel> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataService.delegate = self
        dataService.getAllLeafTRucks()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // SETUP REFRESH CONTROL
        setupRefreshControl()
        dataService.getAllLeafTrucksPrint()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // TEST
        // dataService.getAllLeafTrucksPrint()
        // END TEST”
        
    }
    
    func setupRefreshControl(){
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl.backgroundColor = UIColor.red
        self.refreshControl.tintColor = UIColor.white
        self.refreshControl.addTarget(self, action: #selector(ViewController.refreshTableView), for: .valueChanged)
        
        self.tableView.addSubview(refreshControl)
        
        loadCustomRefreshContents()
    }
    
    func refreshTableView() {
        OperationQueue.main.addOperation {
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }
    
    func loadCustomRefreshContents() {
        let refreshContents = Bundle.main.loadNibNamed("RefreshContents", owner: self, options: nil)
        
        customView = refreshContents?[0] as! UIView
        customView.frame = refreshControl.bounds
        
        for i in 0 ..< customView.subviews.count {
            labelsArray.append(customView.viewWithTag(i + 1) as! UILabel)
        }
        refreshControl.addSubview(customView)
    }
    
    func showAlert(with title: String?, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
}

extension ViewController: DataServiceDelegate {
    func trucksLoaded() {
        
        OperationQueue.main.addOperation {
            self.tableView.reloadData()
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataService.leafTrucks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "leaftruckCell", for: indexPath) as? LeafTruckCell {
            cell.confifCell(truck: dataService.leafTrucks[indexPath.row])
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
}


