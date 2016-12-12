//
//  ViewController.swift
//  scores
//
//  Created by Mac Mini1 on 11/30/15.
//  Copyright © 2015 strix. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var player: UILabel!
    
    @IBOutlet weak var score: UILabel!
    
    @IBOutlet weak var Hscore: UILabel!
    
    @IBOutlet weak var leader: UILabel!
    
    @IBOutlet weak var campoTexto: UITextField!
    
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    var users = [String]()
    
    var currentPlayer = ""
    
    var turnScore = 0
    
    var HighscoreLeader = 0
    
    var leaderName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //asegurandome que haya data antes de traerla
        if(userDefaults.valueForKey("hscore") != nil  && userDefaults.valueForKey("leader") != nil){
            
            //al cargar me encargo que la data persista.
            HighscoreLeader = userDefaults.valueForKey("hscore") as! Int
            leaderName = userDefaults.valueForKey("leader") as! String
            
            Hscore.text = "\(HighscoreLeader)"
            leader.text = leaderName
        
        
            //para ver quienes han jugado hasta ahora
        
            users = userDefaults.objectForKey("usernames") as! [String]
            
            print("todos los que han jugado han sido....")
            print(users)
        
        }//if
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    @IBAction func addPlayer(sender: UIButton) {
        
        let playing = campoTexto.text!
        
        currentPlayer = playing
        
        player.text = currentPlayer
        
        if users.contains(currentPlayer) == false {
            users.append(currentPlayer)
        }

        userDefaults.setObject(users, forKey: "usernames")
        
        print (users)
        
    }
    
    @IBAction func addPoints(sender: UIButton) {
        
        turnScore = turnScore  + 10
        
        score.text = "\(turnScore)"
        
        
        if (turnScore > HighscoreLeader){
            
            HighscoreLeader = turnScore
            Hscore.text = "\(HighscoreLeader)"
            leader.text = currentPlayer
            leaderName = currentPlayer
            
            
            
            userDefaults.setValue(leaderName, forKey: "leader")
        
            userDefaults.setValue(HighscoreLeader, forKey: "hscore")
        }
        
        
    }
    
    @IBAction func Reset(sender: UIButton) {
        
        turnScore = 0
        
        score.text = "\(turnScore)"
        
        player.text = "Quien juega ahora???"
        
        campoTexto.text = ""
        
        
        
    }
    
    
    
}

