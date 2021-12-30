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
    let videoHandler = DisplayPokedexVideo()
    
    func renderPokemon(pokemonName: String, planeNode: SCNNode, imageAnchor: ARImageAnchor, originalNode: SCNNode ) {
        if let pokeScene = SCNScene(named: "art.scnassets/\(pokemonName).scn") {
            if let pokeNode = pokeScene.rootNode.childNodes.first {
//                    planeNode.eulerAngles.x = .pi/2
                planeNode.eulerAngles.x = .pi*2
                planeNode.scale.x = 0.5
                planeNode.scale.y = 0.5
                planeNode.scale.z = 0.5
                
                planeNode.addChildNode(pokeNode)
                
                videoHandler.playVideo(name: pokemonName, imageAnchor: imageAnchor, node: originalNode, pokeNode: pokeNode)
            }
        }
    }
}
