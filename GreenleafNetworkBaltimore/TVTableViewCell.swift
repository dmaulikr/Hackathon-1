//
//  TVTableViewCell.swift
//  GreenleafNetworkBaltimore
//
//  Created by durul dalkanat on 4/30/17.
//  Copyright © 2017 durul dalkanat. All rights reserved.
//

import UIKit

class TVTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var leafTypeLbl: UILabel!
    @IBOutlet weak var price_gramLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func confifCell(truck: LeafTruck) {
        nameLbl.text = truck.name
        leafTypeLbl.text = truck.leafType
        price_gramLbl.text = "$\(truck.price_gram)"
    }
    
}
