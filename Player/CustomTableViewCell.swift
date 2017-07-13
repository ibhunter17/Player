//
//  CustomTableViewCell.swift
//  Player
//
//  Created by Nitish Dang on 2017-07-12.
//  Copyright © 2017 Nitish Dang. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    
    @IBOutlet var countryimage: UIImageView!
    
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
