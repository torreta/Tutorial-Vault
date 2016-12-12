//
//  ViewController.swift
//  APICALLS
//
//  Created by Mac Mini1 on 12/1/15.
//  Copyright © 2015 strix. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // corrections thx to http://stackoverflow.com/questions/31254725/transport-security-has-blocked-a-cleartext-http
    
    //and: http://devdactic.com/rest-api-parse-json-swift/ comments
    
    var tableView:UITableView?
    var items = NSMutableArray()
    
    
    
    override func viewWillAppear(animated: Bool) {
        let frame: CGRect = CGRect(x: 0, y: 100, width: self.view.frame.width, height: self.view.frame.height-100)
        self.tableView = UITableView(frame: frame)
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.view.addSubview(self.tableView!)
        
        let btn = UIButton(frame: CGRect(x: 0, y: 25, width: self.view.frame.height, height: 50))
        
        btn.backgroundColor = UIColor.blueColor()
        btn.setTitle("add new Dummy", forState: UIControlState.Normal)
        btn.addTarget(self, action: "addDummyData", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn)
        
    }
    
    func addDummyData() {
        RestApiManager.sharedInstance.getRandomUser { (json: JSON) in
            let results: JSON = json["results"]
            for (key, subJson) in results {
                if let user: AnyObject = subJson["user"].object {
                    self.items.addObject(user)
                    dispatch_async(dispatch_get_main_queue(),{
                        tableView?.reloadData()
                    })
                }
            }
        }
    }
    
//    func addDummyData() {
//        RestApiManager.sharedInstance.getRandomUser { json in
//            let results = json["results"]
//            for (index: String, subJson: JSON) in results {
//                let user: AnyObject = subJson["user"].object
//                self.items.addObject(user)
//                dispatch_async(dispatch_get_main_queue(),{
//                    tableView?.reloadData()
//                })
//            }
//        }
//    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    

//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        
//        var cell = tableView.dequeueReusableCellWithIdentifier("CELL") as UITableViewCell!
//        
//        if cell == nil {
//        
//            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "CELL")
//        }
//        
//        let user: JSON = JSON(self.items[indexPath.row])
//        
//        let picURL =  user["picture"]["medium"].string
//        let url = NSURL(string: picURL!)
//        let data =  NSData(contentsOfURL: url!)
//        
//        
//        cell?.textLabel?.text = user["username"].string
//        cell?.imageView?.image = UIImage(data: data!)
//    
//        return cell! //empty for now
//    }
//    
//    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("CELL") //as? UITableViewCell
        if cell == nil {
            
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "CELL")
        }
        let user:JSON = JSON(self.items[indexPath.row])
        let picURL = user["picture"]["medium"].string
        let url = NSURL(string: picURL!)
        let data = NSData(contentsOfURL: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
        cell!.textLabel?.text = user["username"].string
        cell?.imageView?.image = UIImage(data: data!)
        return cell!
    }
}

