//
//  ViewController.swift
//  53
//
//  Created by 築山朋紀 on 2019/03/19.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import ARKit
import SceneKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var sceneView: ARSCNView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.showsStatistics = true
        sceneView.scene = SCNScene()
        sceneView.autoenablesDefaultLighting = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        displayNode()
    }
    
    private func displayNode() {
        let node = BaseNode(image: emojiToImage(text: "ありがとう"), width: 0.3)
        
        let position = SCNVector3(x: 0, y: 0, z: -1) // ノードの位置は、左右：0m 上下：0m　奥に100cm
        if let camera = sceneView.pointOfView {
            node.position = camera.convertPosition(position, to: nil) // カメラ位置からの偏差で求めた位置
        }
        sceneView.scene.rootNode.addChildNode(node) // 生成したノードをシーンに追加する
    }
    
    private func emojiToImage(text: String, size: CGFloat = 1000) -> UIImage {
        let outputImageSize = CGSize.init(width: size, height: size)
        let baseSize = text.boundingRect(with: CGSize(width: 2048, height: 2048),
                                         options: .usesLineFragmentOrigin,
                                         attributes: [.font: UIFont.systemFont(ofSize: size / 2)], context: nil).size
        let fontSize = outputImageSize.width / max(baseSize.width, baseSize.height) * (outputImageSize.width / 2)
        let font = UIFont.systemFont(ofSize: fontSize)
        let textSize = text.boundingRect(with: CGSize(width: outputImageSize.width, height: outputImageSize.height),
                                         options: .usesLineFragmentOrigin,
                                         attributes: [.font: font], context: nil).size
        
        let style = NSMutableParagraphStyle()
        style.alignment = NSTextAlignment.center
        style.lineBreakMode = NSLineBreakMode.byClipping
        
        let attr : [NSAttributedString.Key : Any] = [NSAttributedString.Key.font : font,
                                                     NSAttributedString.Key.paragraphStyle: style,
                                                     NSAttributedString.Key.backgroundColor: UIColor.clear ]
        
        UIGraphicsBeginImageContextWithOptions(outputImageSize, false, 0)
        text.draw(in: CGRect(x: (size - textSize.width) / 2,
                             y: (size - textSize.height) / 2,
                             width: textSize.width,
                             height: textSize.height),
                  withAttributes: attr)
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
    }
}

final class BaseNode: SCNNode {
    init(image: UIImage, width: CGFloat) {
        super.init()
        let panelNode = SCNNode(geometry: SCNBox(width: width, height: width * 0.5, length: 0, chamferRadius: 0))
        
        let front = SCNMaterial()
        front.diffuse.contents = image
        let other = SCNMaterial()
        other.diffuse.contents = UIColor.clear
        panelNode.geometry?.materials = [front, other, front, other, other, other]
        
        addChildNode(panelNode)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
