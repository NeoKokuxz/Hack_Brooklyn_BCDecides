//
//  ETableViewCell.swift
//  JobApp
//
//  Created by Naoki on 3/29/20.
//  Copyright © 2020 Naoki. All rights reserved.
//

import UIKit

class ETableViewCell: UITableViewCell {

    @IBOutlet weak var EName: UILabel!
    var ename = ""
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        EName.text = ename
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
