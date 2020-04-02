//
//  VTableViewCell.swift
//  JobApp
//
//  Created by Naoki on 3/29/20.
//  Copyright © 2020 Naoki. All rights reserved.
//

import UIKit

class VTableViewCell: UITableViewCell {

    @IBOutlet weak var VName: UILabel!
    var vname = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        VName.text = vname
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
