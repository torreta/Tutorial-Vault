//
//  strixViewController.swift
//  PassingDataTest
//
//  Created by Mac Mini1 on 11/19/15.
//  Copyright © 2015 strix. All rights reserved.
//

import UIKit

class strixViewController: UIViewController {
    @IBOutlet weak var theLabel: UILabel!
    

    var TextoTemporal: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        theLabel.text = TextoTemporal
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
