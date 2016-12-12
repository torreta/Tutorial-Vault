//
//  ourTableViewCell.swift
//  CustomTableviewTutorial
//
//  Created by Mac Mini1 on 11/19/15.
//  Copyright © 2015 strix. All rights reserved.
//

import UIKit

class ourTableViewCell: UITableViewCell {

    @IBOutlet weak var ourCellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
