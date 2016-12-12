//
//  ViewController.swift
//  PassingDataTest
//
//  Created by Mac Mini1 on 11/19/15.
//  Copyright © 2015 strix. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var theTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let DestViewController : strixViewController = segue.destinationViewController as! strixViewController
        
        DestViewController.TextoTemporal = theTextField.text!
        
    }
}

