//
//  ControlladorCelda.swift
//  Galeria y detalles
//
//  Created by Mac Mini1 on 11/26/15.
//  Copyright © 2015 strix. All rights reserved.
//

import UIKit

class ControlladorCelda: UITableViewCell {

    @IBOutlet weak var Foto: UIImageView!
    @IBOutlet weak var Titulo: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
