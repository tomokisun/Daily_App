//
//  ViewController.swift
//  49
//
//  Created by 築山朋紀 on 2019/03/15.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import ARKit
import SceneKit

class ViewController: UIViewController {
    
    @IBOutlet weak var arScnView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = SCNScene()
        arScnView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARWorldTrackingConfiguration()
        arScnView.session.run(configuration)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        arScnView.session.pause()
    }
    
    @IBAction func handleTap(_ sender: UITapGestureRecognizer) {
        guard let currentFrame = arScnView.session.currentFrame else { return  }
        
        let viewWidth  = arScnView.bounds.width
        let viewHeight = arScnView.bounds.height
        let imagePlane = SCNPlane(width: viewWidth/6000, height: viewHeight/6000)
        imagePlane.firstMaterial?.diffuse.contents = arScnView.snapshot()
        imagePlane.firstMaterial?.lightingModel = .constant
        
        let planeNode = SCNNode(geometry: imagePlane)
        arScnView.scene.rootNode.addChildNode(planeNode)
        
        var translation = matrix_identity_float4x4
        translation.columns.3.z = -0.1
        planeNode.simdTransform = matrix_multiply(currentFrame.camera.transform, translation)
    }
    
}
