//
//  ViewController.swift
//  TODO list
//
//  Created by Mac Mini1 on 11/26/15.
//  Copyright © 2015 strix. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var items = [String]()
    
    
    @IBOutlet weak var Tabla: UITableView!
    @IBOutlet weak var CampoTexto: UITextField!
    
    
    @IBAction func AgregarAlgo(sender: UIButton) {
        
        let texto_para_agregar = CampoTexto.text
        
        items.append(texto_para_agregar!)
        
        CampoTexto.resignFirstResponder() //evade llamar al teclado por defecto de IOS
        
        CampoTexto.text = ""
        
        Tabla.reloadData() //sino, agrega el item pero no recarga, asi que no lo vez...
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return items.count
    }
    

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
    
        let cell = tableView.dequeueReusableCellWithIdentifier("Celda", forIndexPath: indexPath) as UITableViewCell!
        
        cell.textLabel?.text = items[indexPath.row]
        
        cell.textLabel?.textColor = UIColor.redColor()
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        
        let Selected: UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        
        if (Selected.accessoryType == UITableViewCellAccessoryType.None) {
            Selected.accessoryType = UITableViewCellAccessoryType.Checkmark
            Selected.tintColor = UIColor.greenColor()
            
        }else {
            Selected.accessoryType = UITableViewCellAccessoryType.None
        }
  
    }

    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        //
        let Deleted: UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        
        if (editingStyle  == UITableViewCellEditingStyle.Delete){
            items.removeAtIndex(indexPath.row)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
                Deleted.accessoryType = UITableViewCellAccessoryType.None // weird...
            
            
            
            
            Tabla.reloadData() //se puede evitar los anteriores 2 comandos pero te quedas con el checkmark en el row
        }
        
        
    }
    
    
}

