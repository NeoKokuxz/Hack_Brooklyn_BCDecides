//
//  HTableViewCell.swift
//  JobApp
//
//  Created by Naoki on 3/29/20.
//  Copyright © 2020 Naoki. All rights reserved.
//

import UIKit

class HTableViewCell: UITableViewCell {

    @IBOutlet weak var HName: UILabel!
    var hname = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        HName.text = hname
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
