//
//  ViewController.swift
//  true false
//
//  Created by Abhishek Purohit on 17/04/18.
//  Copyright © 2018 Abhishek Purohit. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    
    var screenCenter: CGPoint!
    var trueButton: SCNNode!
    var falseButton: SCNNode!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        /// Creates A Menu With A True Or False Button Using SCNText Geometry
        
            
            //1. Create A Menu Holder
            let menu = SCNNode()
            
            //2. Create A True Button With An SCNText Geometry & Green Colour
            let trueButton = SCNNode();
            let trueTextGeometry = SCNText(string: "True" , extrusionDepth: 1)
            trueTextGeometry.font = UIFont(name: "Helvatica", size: 3)
            trueTextGeometry.flatness = 0
            trueTextGeometry.firstMaterial?.diffuse.contents = UIColor.green
            trueButton.geometry = trueTextGeometry
            trueButton.scale = SCNVector3(0.01, 0.01 , 0.01)
            trueButton.name = "True"
            
            //3. Create A False Button With An SCNText Geometry & Red Colour
            let falseButton = SCNNode();
            let falseTextGeometry = SCNText(string: "False" , extrusionDepth: 1)
            falseTextGeometry.font = UIFont(name: "Helvatica", size: 3)
            falseTextGeometry.flatness = 0
            falseTextGeometry.firstMaterial?.diffuse.contents = UIColor.red
            falseButton.geometry = falseTextGeometry
            falseButton.scale = SCNVector3(0.01, 0.01 , 0.01)
            falseButton.name = "False"
            
            //4. Set The Buttons Postions
            trueButton.position = SCNVector3(-0.6,0,0)
            falseButton.position = SCNVector3(0.6,0,0)
            
            //5. Add The Buttons To The Menu Node & Set Its Position
            menu.addChildNode(trueButton)
            menu.addChildNode(falseButton)
            menu.position = SCNVector3(0,0, -1.5)
            
            //6. Add The Menu To The View
            sceneView.scene.rootNode.addChildNode(menu)
        
        
        DispatchQueue.main.async {
            self.screenCenter = CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height/2)
            
        }
        
        
        
    }
    
   
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    // MARK: - ARSCNViewDelegate
    
    /*
     // Override to create and configure nodes for anchors added to the view's session.
     func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
     let node = SCNNode()
     
     return node
     }
     */
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}

