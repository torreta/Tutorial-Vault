//
//  ViewController.swift
//  table
//
//  Created by Mac Mini1 on 11/26/15.
//  Copyright © 2015 strix. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tabla: UITableView!
    
    var ciudades = ["Caracas","La Guaira","El Tigre","Valencia", "Nueva Esparta"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return ciudades.count
    }
    

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
    
        let cell = tableView.dequeueReusableCellWithIdentifier("Celda", forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel?.text = ciudades[indexPath.row]
        
        return cell
    }
    
    
}

