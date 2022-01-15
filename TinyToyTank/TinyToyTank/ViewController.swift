//
//  ViewController.swift
//  TinyToyTank
//
//  Created by nju on 2022/1/14.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    var tankAnchor: TinyToyTank._TinyToyTank?
    var isActionPlaying: Bool = false
    
    @IBAction func tankLeft(_ sender: Any) {
        if self.isActionPlaying {
            return
        }
        else {
            self.isActionPlaying = true
        }
        tankAnchor!.notifications.tankLeft.post()
    }
    
    @IBAction func tankForward(_ sender: Any) {
        if self.isActionPlaying {
            return
        }
        else {
            self.isActionPlaying = true
        }
        tankAnchor!.notifications.tankForward.post()
    }
    
    @IBAction func tankRight(_ sender: Any) {
        if self.isActionPlaying {
            return
        }
        else {
            self.isActionPlaying = true
        }
        tankAnchor!.notifications.tankRight.post()
    }
    
    @IBAction func turretLeft(_ sender: Any) {
        if self.isActionPlaying {
            return
        }
        else {
            self.isActionPlaying = true
        }
        tankAnchor!.notifications.turretLeft.post()
    }
    
    @IBAction func turretRight(_ sender: Any) {
        if self.isActionPlaying {
            return
        }
        else {
            self.isActionPlaying = true
        }
        tankAnchor!.notifications.turretRight.post()
    }
    
    @IBAction func cannonFile(_ sender: Any) {
        if self.isActionPlaying {
            return
        }
        else {
            self.isActionPlaying = true
        }
        tankAnchor!.notifications.cannonFire.post()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the "Box" scene from the "Experience" Reality File
        tankAnchor = try! TinyToyTank.load_TinyToyTank()
        tankAnchor!.turret?.setParent(tankAnchor!.tank, preservingWorldTransform: true)
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(tankAnchor!)
        
        tankAnchor?.actions.actionComplete.onAction = {
            _ in
            self.isActionPlaying = false
        }
    }
}
