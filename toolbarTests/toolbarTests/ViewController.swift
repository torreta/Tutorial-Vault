//
//  ViewController.swift
//  toolbarTests
//
//  Created by Mac Mini1 on 11/27/15.
//  Copyright © 2015 strix. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var Imagen: UIImageView!
    
    var pickerImagenes = UIImagePickerController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Imagen.image = UIImage(named: "pixel1.png")
        pickerImagenes.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func CamaraCallBtn(sender: AnyObject) {
        pickerImagenes.sourceType = UIImagePickerControllerSourceType.Camera
        presentViewController(pickerImagenes, animated: true, completion: nil)
    }
    
    
    @IBAction func LibraryCallBtn(sender: AnyObject) {
        pickerImagenes.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(pickerImagenes, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        Imagen.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
}

