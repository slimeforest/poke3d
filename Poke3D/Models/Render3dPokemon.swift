//
//  render3dPokemon.swift
//  Poke3D
//
//  Created by Jack Battle on 12/23/21.
//

import Foundation
import SceneKit
import ARKit

class Render3dPokemon {
    func renderPokemon(name: String, planeNode: SCNNode, anchor: ARImageAnchor ) {
        if let pokeScene = SCNScene(named: "art.scnassets/\(name).scn") {
            if let pokeNode = pokeScene.rootNode.childNodes.first {
//                    planeNode.eulerAngles.x = .pi/2
                planeNode.eulerAngles.x = .pi*2
                planeNode.scale.x = 0.5
                planeNode.scale.y = 0.5
                planeNode.scale.z = 0.5
                
                planeNode.addChildNode(pokeNode)
                
                
                playVideo(name: name, pokeNode: pokeNode, anchor: anchor)
            }
        }
    }
    
    func playVideo(name: String, pokeNode: SCNNode, anchor: ARImageAnchor){
        print("video played")
        
        var videoNode = SKVideoNode(fileNamed: "Charmander.mp4")
        
        
        let videoScene = SKScene(size: CGSize(width: 1280, height: 720))
        videoNode.position = CGPoint(x: videoScene.size.width / 2, y: videoScene.size.height / 2)
        videoNode.yScale = -1.0
        videoScene.addChild(videoNode)
        
        let videoPlane = SCNPlane(width: anchor.referenceImage.physicalSize.height, height: anchor.referenceImage.physicalSize.width)
        
        videoPlane.firstMaterial?.diffuse.contents = videoScene
        
        let videoPlaneNode = SCNNode(geometry: videoPlane)
        pokeNode.addChildNode(videoPlaneNode)
        videoPlaneNode.position.y = pokeNode.position.y + 0.2
        videoNode.play()
    }
}
