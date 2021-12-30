//
//  DeterminePokemon.swift
//  Poke3D
//
//  Created by Jack Battle on 12/30/21.
//

import Foundation
import SceneKit
import ARKit

class DeterminePokemon {
    let pokeRenderer = Render3dPokemon()
    
    func checkCard(cardDetected: String, node: SCNNode, detectedAnchor: ARImageAnchor, baseNode: SCNNode){

        switch cardDetected {
        case "Charmander":
            pokeRenderer.renderPokemon(pokemonName: cardDetected, planeNode: node, imageAnchor: detectedAnchor, originalNode: baseNode)
        case "Pikachu":
            pokeRenderer.renderPokemon(pokemonName: cardDetected, planeNode: node, imageAnchor: detectedAnchor, originalNode: baseNode)
        case "Beedrill":
            pokeRenderer.renderPokemon(pokemonName: cardDetected, planeNode: node, imageAnchor: detectedAnchor, originalNode: baseNode)
        case "Haunter":
            pokeRenderer.renderPokemon(pokemonName: cardDetected, planeNode: node, imageAnchor: detectedAnchor, originalNode: baseNode)
            
        default:
            print("Unknown card detected")
        }
    }
}
