//
//  ViewController.swift
//  RevivalXTableView
//
//  Created by Mac Mini1 on 11/16/15.
//  Copyright © 2015 strix. All rights reserved.
//


import UIKit
import Alamofire
import Haneke

 class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var datas: [JSON] = []
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var TestLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateIP()
       }

    
//
//    
//    print("llego al print, antes de alamofire")
//    print("version de alamofire, segun el string: ", AlamofireVersionNumber)
//    //        Alamofire.request(.GET, "https://api.instagram.com/v1/tags/malaysia/media/recent?client_id=324b6bb67f004311a4d463abff618501").responseJSON {  response in
//    //            if response.result.isSuccess {
//    //                print("segun esto llego respuesta")
//    //                if let JSON = response.result.value {
//    //                    print("JSON: \(JSON)")
//    //                }
//    //            }else{
//    //                print("nanay... ni request llego...")
//    //            }
//    //        }
//    
//    Alamofire.request(.GET, "https://httpbin.org/get", parameters: ["foo": "bar"])
//    .responseJSON { response in
//    print(response.request)  // original URL request
//    print(response.response) // URL response
//    print(response.data)     // server data
//    print(response.result)   // result of response serialization
//    print("si entra al request pero ni se entera que se supone que imprima")
//    if let JSON = response.result.value {
//    print("JSON: \(JSON)")
//    }
//    }
//    
//    print("despues del request de alamofire.")
//    
//    print("request de por NSURL")
//    
//    let postEndpoint: String = "https://httpbin.org/ip"
//    let url = NSURL(string: postEndpoint)!
//    
//    let session = NSURLSession.sharedSession()
//    session.dataTaskWithURL(url,completionHandler: {(data:NSData?, response: NSURLResponse?, error: NSError? ) -> Void in
//    //Lee el JSON
//    do{
//    if let ipString = NSString(data: data!, encoding: NSUTF8StringEncoding){
//    //Parse JSON to get the IP
//    let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
//    
//    let origin = jsonDictionary["origin"] as! String
//    let originx = origin + " sambas"
//    
//    // Actualizo el label???
//    self.performSelectorOnMainThread("updateTestLabel", withObject: originx, waitUntilDone: false)
//    }
//    }catch{
//    print("algo malo paso.... no llego respuesta" )
//    }
//    
//    }).resume()
//    
//    print("despues del tipo de llamada NSURL")
//    
    
    
    //        Alamofire.request(.GET, "https://api.instagram.com/v1/tags/malaysia/media/recent?client_id=324b6bb67f004311a4d463abff618501").responseJSON { (request, response, json, error) in
    //            if json != nil {
    //                var jsonObj = JSON(json!)
    //                if let data = jsonObj["data"].arrayValue as [JSON]?{
    //                    self.datas = data
    //                    self.tableView.reloadData()
    //                }
    //            }
    //        }
    
    //here //       Alamofire.request(.GET, "https://api.instagram.com/v1/tags/malaysia/media/recent?client_id=324b6bb67f004311a4d463abff618501").responseJSON {  response in
    //            if response.result.isSuccess {
    //                if let value = response.result.value {
    //                //desde la linea anterior empezaron las adaptaciones al codigo comentado de alla arriba
    //                    guard let value = response.result.value else {
    //                        print("Error: did not receive data")
    //                        return
    //                    }
    //
    //                    guard response.result.error == nil else {
    //                       print("error calling GET on /posts/1")
    //                       print(response.result.error)
    //                       return
    //                    }
    //
    //                    print("JSON: \(JSON)")
    //                    //here adaptations continue
    //
    ////                    var jsonObj = JSON(value)
    ////                    let post = JSON(value)
    ////
    //
    //
    //
    //                }else{
    //                    print("sorry bro, no aswer")
    //
    //                }
    
    
    
    //if let JSON = response.result.value {
    //     print("JSON: \(JSON)")
    // }
    
    //  }
    
    
    
    //
    
    //
    //                var jsonObj = JSON(value)
    //                let JSONe = value
    ////                let post = JSON(value)
    //
    //        let jsonDic = response.result.value as! NSDictionary
    //        let responseData = jsonDic["responseData"] as! NSDictionary
    
    //                print("The post is: " + post.description)
    //                if let title = post["title"].String {
    //                    print("The title is: " + title)
    //                } else {
    //                    print("Error parsing /posts/1")
    //                }
    //
    //
    //                //adaptaciones al
    //
    ////                var jsonObj = JSON(json!)
    //
    //                print("JSON: \(JSONe)")
    //            }
    //        }
    
    
    
    func updateIP() {
        
        // Setup the session to make REST GET call.  Notice the URL is https NOT http!!
        let stuff: String = "99"
        let postEndpoint: String = "https://httpbin.org/ip"
        print("that"+stuff + "sip, sirve")
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: postEndpoint)!
        
        // Make the POST call and handle it in a completion handler
        session.dataTaskWithURL(url, completionHandler: { ( data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            // Make sure we get an OK response
            guard let realResponse = response as? NSHTTPURLResponse where
                realResponse.statusCode == 200 else {
                    print("Not a 200 response")
                    return
            }
            
            // Read the JSON
            do {
                if let ipString = NSString(data:data!, encoding: NSUTF8StringEncoding) {
                    // Print what we got from the call
                    print(ipString)
                    
                    // Parse the JSON to get the IP
                    let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                    let origin = jsonDictionary["origin"] as! String
                    
                    // Update the label
                    self.performSelectorOnMainThread("updateIPLabel:", withObject: origin, waitUntilDone: false)
                }
            } catch {
                print("bad things happened")
            }
        }).resume()

    
    
    
    
    
//    override func didReceiveMemoryWarning() {
    func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return datas.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ImageCell", forIndexPath: indexPath) as UITableViewCell //1
        let data = datas[indexPath.row]
        if let captionLabel = cell.viewWithTag(100) as? UILabel {
//            if let caption = data["caption"]["text"].string{
//                captionLabel.text = caption
//            }
        }
        if let imageView = cell.viewWithTag(101) as? UIImageView {
//            if let urlString = data["images"]["standard_resolution"]["url"].string{
//                let url = NSURL(string: urlString)
//                imageView.hnk_setImageFromURL(url!)
//            }
        }
        return cell
    }
    
        //MARK: - Methods to update the UI immediately
//        func updateIPLabel(text: String) {
//            self.ipLabel.text = "Your IP is " + text
//        }
//        
//        func updatePostLabel(text: String) {
//            self.postResultLabel.text = "POST : " + text
//        }
//        
        func updateTestLabel(text: String) {
            self.TestLabel.text = "El Test :" + text
        }
        
}