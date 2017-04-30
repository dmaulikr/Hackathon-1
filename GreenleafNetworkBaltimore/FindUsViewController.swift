//
//  FindUsViewController.swift
//  GreenleafNetworkBaltimore
//
//  Created by durul dalkanat on 4/29/17.
//  Copyright © 2017 durul dalkanat. All rights reserved.
//

import UIKit
import MapKit

class FindUsViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView?
    @IBOutlet weak var locationLabel: UILabel?
    @IBOutlet weak var distanceLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    @IBAction func onPreviosLocation(_ sender: AnyObject) {
        print("Previous location")
        
        distanceLabel?.text = "2,5 Mi"
        locationLabel?.text = "21th St & Silent Rd\n(345)123-0987\nPhoenix,AZ 42200"
    }
    
    @IBAction func onNextLocation(_ sender: AnyObject) {
        print("Next location")
        
        locationLabel?.text = "21th St & Silent Rd\n(345)123-0987\nPhoenix,AZ 42200"
        distanceLabel?.text = "2,5 Mi"
    }
    
    @IBAction func onMakeReservation(_ sender: AnyObject) {
        let alert = UIAlertView(title: "Thank You", message: "You have booked doctor. Thanks for your appointment.", delegate: nil, cancelButtonTitle: "Ok")
        alert.show()
    }
}
