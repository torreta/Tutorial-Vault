//
//  ViewController.swift
//  CleanExperimentRequest
//
//  Created by Mac Mini1 on 11/18/15.
//  Copyright © 2015 strix. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var requestLabel: UILabel!
    
    @IBOutlet weak var originLabel: UILabel!
    
    @IBOutlet weak var urlLabel: UILabel!
    
    @IBOutlet weak var postLabel: UILabel!
    
    @IBOutlet weak var testLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // siguientes metodos a mano
        print("llamo al metodo:")
        UpdateLabels()
        solicitudPost()
    }

    //de aqui en adelante es puto custom a excepcion de didReceiveMemory
    
    
    /*
        Aqui me encargare de tomar los 3 labels y cambiarlos por la informacion que me
        venga del request http que le haga a la pagina o a las paginas....
    */
    func UpdateLabels(){
    
        //el url a consultar
        //        let Endpoint: String = "https://httpbin.org/get"
        let Endpoint: String = "https://httpbin.org/get"
//        let Endpoint: String = "http://api.randomuser.me"
        let session = NSURLSession.sharedSession()  //una session para la tarea
        let url = NSURL(string: Endpoint)!          //transformo a url...
        
        
        session.dataTaskWithURL(url, completionHandler: { ( data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            // Aseguro que sea una respuesta 200 o me salgo
            guard let realResponse = response as? NSHTTPURLResponse where
                realResponse.statusCode == 200 else {
                    print("Not a 200 response")
                    return
            }
            
            //si paso la validacion anterior significa que obtuvimos respuesta
            

            

            // Leemos el json que nos llego del servidor
            do {
                if let ipString = NSString(data:data!, encoding: NSUTF8StringEncoding) {
                // Vemos que nos trajo el request
                print(ipString)
                    
                // Parse the JSON to get the IP
                let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                
                //un pseudo arreglo del cual sacar las respuestas que quieras
                let origin = jsonDictionary["origin"] as! String
                let url = jsonDictionary["url"] as! String
                
                    
                    //esto aqui porque era multinivel el header.
                    if let headers = jsonDictionary["headers"] as? NSDictionary{
                        let accept_d = headers["Accept-Encoding"] as? String
                        print(headers)
                        print(accept_d)
                    }
                    
                    print(origin)
                    print(url)
                    
                    
                    
                // Cambio las Etiquetas
                let Respuesta: String = "ok" //para colocarlo en al actualizar el label titulo.
                print(Respuesta)
                    
                self.performSelectorOnMainThread("updateResquestLabel:", withObject: Respuesta, waitUntilDone: false)
                
                self.performSelectorOnMainThread("updateOriginLabel:", withObject: origin, waitUntilDone: false)
                    
                self.performSelectorOnMainThread("updateUrlLabel:", withObject: url, waitUntilDone: false)
                    
                    
                }
            } catch {
                print("El Request Probablente se perdio...")
            }
        }).resume()
     
        
        print("se acabo el metodo.... Update labels")
    }
    
    
    func solicitudPost(){
        print("llame a post... estoy seguro")
        // Setup the session to make REST POST call
        // asegurate que sean llamdas https o eres automaticamente bloqueado por IOS (o debes hacer la excepcion on la plist)
        let postEndpoint: String = "http://requestb.in/1gjhcj41" //edita esto para que sea igual al un bin de request de esa pagina
        let url = NSURL(string: postEndpoint)!
        let session = NSURLSession.sharedSession()
        let postParams : [String: AnyObject] = ["hello": "Hello POST world"]
        
        // Create the request
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        do {
            request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(postParams, options: NSJSONWritingOptions())
            print(postParams)
        } catch {
            print("bad things happened")
        }
        
        // Make the POST call and handle it in a completion handler
        session.dataTaskWithRequest(request, completionHandler: { ( data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            // Make sure we get an OK response
            guard let realResponse = response as? NSHTTPURLResponse where
                realResponse.statusCode == 200 else {
                    print("Not a 200 response")
                    return
            }
            
            
            
            // Read the JSON
            if let postString = NSString(data:data!, encoding: NSUTF8StringEncoding) as? String {
                // Print what we got from the call
                print("POST: " + postString)
                self.performSelectorOnMainThread("updatePostLabel:", withObject: postString, waitUntilDone: false)
                
                let testdeprueba = " sirve, so? XD niiiiice..."
                self.performSelectorOnMainThread("updateTestLabel:", withObject: testdeprueba, waitUntilDone: false)
            }
            
        }).resume()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //He aqui los metodos de esta clase que llamare para modificar los labels...
    func updateResquestLabel(text: String) {
        self.requestLabel.text = "El Request Http me digo: " + text
    }
    
    func updateOriginLabel(text: String) {
        self.originLabel.text = "IP: " + text + ", era el mio"
    }
    
    func updateUrlLabel(text: String) {
        self.urlLabel.text = "El Url al que llame fue: " + text
    }
    
    func updatePostLabel(text: String) {
        self.postLabel.text = "llamada post: " + text
    }
    
    func updateTestLabel(text: String) {
        self.testLabel.text = "Probando POST " + text
    }

}

