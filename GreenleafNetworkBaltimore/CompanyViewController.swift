//
//  CompanyViewController.swift
//  GreenleafNetworkBaltimore

import UIKit

class CompanyViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var dataService = CompanyService.instance
    
    var allLeafCompany = [CompanyModel]()
    let theme = ThemeManager.currentTheme()
    
    var refreshControl: UIRefreshControl!
    var customView: UIView!
    var labelsArray: Array<UILabel> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataService.delegate = self
        dataService.getAllLeafCompanies()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // SETUP REFRESH CONTROL
        setupRefreshControl()
        dataService.getAllLeafCompaniesPrint()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // TEST
        dataService.getAllLeafCompaniesPrint()
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

extension CompanyViewController: CompanyServiceDelegate {
    func companiesLoaded() {
        
        OperationQueue.main.addOperation {
            self.tableView.reloadData()
        }
    }
    
}

extension CompanyViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataService.leafCompanies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "companytruckCell", for: indexPath) as? CompanyTableViewCell {
            cell.confifCell(company: dataService.leafCompanies[indexPath.row])

            return cell
        } else {
            return UITableViewCell()
        }
    }
    
}


