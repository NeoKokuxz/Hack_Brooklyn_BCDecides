//
//  NTableViewCell.swift
//  JobApp
//
//  Created by Naoki on 3/29/20.
//  Copyright © 2020 Naoki. All rights reserved.
//

import UIKit

class NTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var NName: UILabel!
    var nname = ""

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        NName.text = nname
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
