//
//  ViewController.swift
//  PickFrutal
//
//  Created by Mac Mini1 on 11/20/15.
//  Copyright © 2015 strix. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate {

    var frutas = ["Agarra una Fruta XD","Lima", "Limon", "Manzana","Durazno","Cambur","Mandarina"]
    
    @IBOutlet weak var ImagenSota: UIImageView!
    
    @IBOutlet weak var descripcion: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        ImagenSota.image = UIImage(named: "Frutas.jpg")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    // returns the number of 'columns' to display.

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
    
        return 1;
    }
    
    // returns the # of rows in each component..

    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
    
        return frutas.count
    
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    
        return frutas[row]
    }

    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
    
        let frutaSeleccionada = frutas[row]
        
        switch(frutaSeleccionada){
            
            case "Lima":ImagenSota.image = UIImage(named: "Lima.jpg"); descripcion.text = "Esta Fruta es amarilla y acida."
            case "Limon":ImagenSota.image = UIImage(named: "Limon.jpg"); descripcion.text = "Esta Fruta es acida y verde."
            case "Manzana":ImagenSota.image = UIImage(named: "Manzana.jpg"); descripcion.text = "Esta Fruta es roja y dulce."
            case "Durazno":ImagenSota.image = UIImage(named: "Durazno.jpg"); descripcion.text = "Esta Fruta es amarilla y dulce."
            case "Cambur":ImagenSota.image = UIImage(named: "Cambur.jpg"); descripcion.text = "Esta Fruta es amarilla, dulce y tiene concha."
            case "Mandarina":ImagenSota.image = UIImage(named: "Mandarina.jpg"); descripcion.text = "Esta Fruta es naranja, a veces acida a veces dulce."
            
        
            default: ImagenSota.image = UIImage(named: "Frutas.jpg"); descripcion.text = "Disfruta de otra Fruta."
        }
        
    
    }
}

