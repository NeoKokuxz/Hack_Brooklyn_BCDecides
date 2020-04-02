//
//  BTableViewCell.swift
//  JobApp
//
//  Created by Naoki on 3/29/20.
//  Copyright © 2020 Naoki. All rights reserved.
//

import UIKit

class BTableViewCell: UITableViewCell {

    @IBOutlet weak var BName: UILabel!
    
    var bname = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        BName.text = bname
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
