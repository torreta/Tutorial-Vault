//
//  ViewController.swift
//  JuegoDelNumero
//
//  Created by Mac Mini1 on 11/20/15.
//  Copyright © 2015 strix. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var NumeroCampo: UITextField!
    
    var NumeroCorrecto: UInt32 = arc4random_uniform(6)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(NumeroCorrecto) //ayuda inicial al cargar
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    func reCalcular(){
        //agarro otro numero random
        NumeroCorrecto = arc4random_uniform(6)
        print(NumeroCorrecto)
    }
    
    
    @IBAction func VerNumero(sender: AnyObject) {
        
        var adivinado = NumeroCampo.text
        var real = String(NumeroCorrecto)
        
        if( adivinado == real ){
            titulo.text = "Uff que Suerte Tienes!!! la Pegaste!!"
            titulo.textColor = UIColor.greenColor()
            
        }else{
            titulo.text = "dang!! casi, estaba pensando en el numero \(real), intestas otra vez?" ;
            titulo.textColor = UIColor.redColor()
        }
        
        reCalcular()
        
    }
    

}

