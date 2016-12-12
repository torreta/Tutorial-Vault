//
//  ControladorTableView.swift
//  Galeria y detalles
//
//  Created by Mac Mini1 on 11/26/15.
//  Copyright © 2015 strix. All rights reserved.
//

import UIKit

class ControladorTableView: UITableViewController {

    var arrayDeCosos: [cosos] = [cosos]() //asi porque es del tipo cosos, y esta vacio
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let coso1 = cosos(imageName: "img1.png", name: "fresito", description: "entre sifrino y fresa... pero es medio antipatico... ewww...")
        let coso2 = cosos(imageName: "img2.png", name: "birra", description: "no preguntes, sabes que quieres cerveza negra y de caricatura. jajaja")
        let coso3 = cosos(imageName: "img3.png", name: "botella", description: "leche, agua o esta vacia??? descubrelo en el proximo capitulo XD")
        let coso4 = cosos(imageName: "img4.png", name: "trago?", description: "debe ser una margarita, o eso me han hecho creer... estara aliñado?")
        let coso5 = cosos(imageName: "img5.png", name: "gelatina", description: "ni idea de si es de fresa o patilla, mi lengua niche no lo diferencia... pero esta buena.")
        
        arrayDeCosos.append(coso1)
        arrayDeCosos.append(coso2)
        arrayDeCosos.append(coso3)
        arrayDeCosos.append(coso4)
        arrayDeCosos.append(coso5)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1 //hasta ahorita he entenddido que se refiere a una especie de sub arreglo
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayDeCosos.count
    }

   
    //estaba comentado, lo descomento porque es necesario implementarlo, pero como tenemos un clase de celda custom, es necesario
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Celda", forIndexPath: indexPath) as! ControlladorCelda
                                                                //^ ese celda viene del prototipo de la celda
        // Configure the cell...
        let Seleccionado = arrayDeCosos[indexPath.row]
        
        cell.Foto.image = UIImage(named: Seleccionado.imageName)
        cell.Titulo.text = Seleccionado.name
        
        return cell
    }

    //NO ESTABA MAL LO QUE HICE PERO HABIA SELECCIONADO DID"DESELECT A ROW..." LO IDEAL ES SELECCIONAR... BRUTO...
//
//    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
//        
//        let cosoSeleccionado = arrayDeCosos[indexPath.row]
//        
//        let vista: vistaDetalles = self.storyboard?.instantiateViewControllerWithIdentifier("detalles") as!  vistaDetalles
//        
//        vista.nombreimagen = cosoSeleccionado.imageName
//        vista.nombre = cosoSeleccionado.name
//        vista.descripcion = cosoSeleccionado.descripcion
//
//        self.presentViewController(vista, animated: true, completion: nil)
//    }
//    
    
    //EL OTRO ESTABA BIEN, PERO LA ACCION QUE LE OCURRIA AL ROW, ESTABA MAL... AGARRE SIN QUERER: "didDeselectRowAtIndexPath"
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cosoSeleccionado = arrayDeCosos[indexPath.row]
        
        let vista: vistaDetalles = self.storyboard?.instantiateViewControllerWithIdentifier("detalles") as!  vistaDetalles
        
        vista.nombreimagen = cosoSeleccionado.imageName
        vista.nombre = cosoSeleccionado.name
        vista.descripcion = cosoSeleccionado.descripcion
        
        self.presentViewController(vista, animated: true, completion: nil)
    }
    
    /*
        DE AQUI EN ADELANTE ES IMPORTANTE QUE TE DES CUENTA QUE LAS SIGUIENTES FUNCIONES PUEDEN NO SER NECESARIA
    */
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
