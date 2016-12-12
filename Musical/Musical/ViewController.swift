//
//  ViewController.swift
//  Musical
//
//  Created by Mac Mini1 on 11/27/15.
//  Copyright © 2015 strix. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {

    var audioPlayer = AVAudioPlayer()
    
    var audioPath = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Welcome to Planet Urf", ofType: "mp3")!)
    
    var PlayPauseState = UIBarButtonItem()
    
    var musicPaused: Bool = false
    
    @IBOutlet weak var Barra: UIToolbar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        do {
        
            audioPlayer = try AVAudioPlayer(contentsOfURL: audioPath)
            
        }catch{
            print("audio file not found")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func PlayPause(sender: UIBarButtonItem) {
        
        var items = Barra.items!
        
        if (musicPaused == false	) {
            //boton a pause
            PlayPauseState = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Pause , target: self, action: "PlayPause:")
            
            //el arreglo de cosas en el toolbar
            items[0] = PlayPauseState
            Barra.setItems(items, animated: true)
            musicPaused = true;
            
             audioPlayer.play()
            
        }else {
            
//            var items = Barra.items! //si falla descomenta esto
            
            //boton a play...
            PlayPauseState = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Play , target: self, action: "PlayPause:")
            
            //el arreglo de cosas en el toolbar
            items[0] = PlayPauseState
            Barra.setItems(items, animated: true)
            musicPaused = false;
            
            audioPlayer.pause()
            
            
        }
        
        
        
    }//func

    
    @IBAction func Detente(sender: UIBarButtonItem) {
        
        var items = Barra.items!
        
        //paro la musica
        audioPlayer.stop()
        
        //la devuelvo al segundo cero, osea al inicio
        audioPlayer.currentTime = 0 //vuelve al segundo 0 de la pista de audio.
        
        // hago un icono de play.
        PlayPauseState = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Play , target: self, action: "PlayPause:")
        //el arreglo de cosas en el toolbar
        items[0] = PlayPauseState
        Barra.setItems(items, animated: true)
        musicPaused = false;

 
    }//func
    
    
    
}

