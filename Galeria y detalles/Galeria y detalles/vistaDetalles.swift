//
//  vistaDetalles.swift
//  Galeria y detalles
//
//  Created by Mac Mini1 on 11/27/15.
//  Copyright © 2015 strix. All rights reserved.
//

import UIKit

class vistaDetalles: UIViewController {

    @IBOutlet weak var Imagen: UIImageView!
    
    @IBOutlet weak var Titulo: UILabel!
    
    @IBOutlet weak var Detalles: UILabel!
    
    
    var nombreimagen = ""
    var nombre = ""
    var descripcion = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Imagen.image = UIImage(named: nombreimagen)
        
        Titulo.text = nombre
        
        Detalles.text = descripcion
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
