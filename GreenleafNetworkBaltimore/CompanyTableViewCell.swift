//
//  CompanyTableViewCell.swift
//  GreenleafNetworkBaltimore
//
//  Created by durul dalkanat on 4/29/17.
//  Copyright © 2017 durul dalkanat. All rights reserved.
//

import UIKit

class CompanyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var lucpcLbl: UILabel!
    @IBOutlet weak var imageLeaf: UIImageView!
    @IBOutlet weak var typeLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func confifCell(company: CompanyModel) {
        nameLbl.text = company.name
        lucpcLbl.text = company.producer
        typeLbl.text = company.type
    }
}
