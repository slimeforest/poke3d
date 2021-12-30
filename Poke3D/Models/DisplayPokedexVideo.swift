//
//  DisplayPokedexVideo.swift
//  Poke3D
//
//  Created by Jack Battle on 12/30/21.
//

import Foundation
import SceneKit
import ARKit

class DisplayPokedexVideo {
    func playVideo(name: String, imageAnchor: ARImageAnchor, node: SCNNode, pokeNode: SCNNode) {
        var videoNode = SKVideoNode(fileNamed: "\(name).mp4")
        let videoScene = SKScene(size: CGSize(width: 1280, height: 720))
        videoNode.position = CGPoint(x: videoScene.size.width / 2, y: videoScene.size.height / 2)
        videoNode.yScale = -1.0
        videoScene.addChild(videoNode)
        
        let videoPlane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.height, height: imageAnchor.referenceImage.physicalSize.width)
        
        videoPlane.firstMaterial?.diffuse.contents = videoScene
        
        let videoPlaneNode = SCNNode(geometry: videoPlane)
        node.addChildNode(videoPlaneNode)
        videoPlaneNode.position.y = pokeNode.position.y + 0.2
        videoNode.play()
    }
}
