//
//  GameViewController.swift
//  solo-mission
//
//  Created by zehua guo on 2018/5/22.
//  Copyright © 2018年 zehua guo. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import AVFoundation

class GameViewController: UIViewController {
    //public static var HistoryValues = " "
    var backingAudio = AVAudioPlayer()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let  filePath = Bundle.main.path(forResource: "Backing Audio", ofType: "mp3")
        let audioNSURL = NSURL(fileURLWithPath: filePath!)
        do {backingAudio = try AVAudioPlayer(contentsOf: audioNSURL as URL)}
        catch {return print("Cannt Find The Audio")}
        
        backingAudio.numberOfLoops = -1
        backingAudio.play()
        
        
        
        
        
        
        
        
        guard let view = self.view as! SKView? else  {
            return
        }
        
        // Load the SKScene from 'GameScene.sks'
        var size: CGSize = self.view.bounds.size
        size.width *= UIScreen.main.scale
        size.height *= UIScreen.main.scale
        let scene = GameScene(size: size)
        // Set the scale mode to scale to fit the window
        scene.scaleMode = .aspectFill
        
        // Present the scene
        view.presentScene(scene)
        
        view.ignoresSiblingOrder = true
        
        view.showsFPS = true
        view.showsNodeCount = true
        
    }
    
    override var shouldAutorotate: Bool {
        get {
            return true
        }
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
            if UIDevice.current.userInterfaceIdiom == .phone {
                return .allButUpsideDown
                
            } else {
                return .all
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override var prefersStatusBarHidden: Bool {
        get {
            return true
        }
    }
    
}
