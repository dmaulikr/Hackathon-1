//
//  DoctorViewController.swift
//  GreenleafNetworkBaltimore
//
//  Created by durul dalkanat on 4/30/17.
//  Copyright © 2017 durul dalkanat. All rights reserved.
//

import UIKit

class DoctorViewController: UIViewController {
    @IBOutlet weak var doctorIMG: UIImageView!

    @IBOutlet weak var formBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formBtn.addTarget(self, action: #selector(getter: DoctorViewController.formBtn), for: .touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func formBtn(_ sender: Any) {
        
        UIApplication.shared.openURL(NSURL(string: "https://docs.google.com/forms/d/e/1FAIpQLSfIYA9pLrfNAjfKP97lKVhWLSpSv-Cuqq_TQKZhFcy_Xso_ow/viewform")! as URL)
    }
}
