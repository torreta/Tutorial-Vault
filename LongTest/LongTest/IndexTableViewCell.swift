//
//  IndexTableViewCell.swift
//  LongTest
//
//  Created by Mac Mini1 on 11/20/15.
//  Copyright © 2015 strix. All rights reserved.
//

import UIKit

class IndexTableViewCell: UITableViewCell {

    @IBOutlet weak var ImagenCelda: UIView!
    @IBOutlet weak var TituloCelda: UILabel!
    @IBOutlet weak var DescripcionCelda: UILabel!
    
    var titulo: String = ""
    var urlImagen: String = ""
    var descripcion: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func BotonCelda(sender: AnyObject) {
    }
}
