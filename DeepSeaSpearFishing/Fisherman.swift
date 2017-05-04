//
//  Fisherman.swift
//  DeepSeaSpearFishing
//
//  Created by alejandro casanas on 5/4/17.
//  Copyright © 2017 AlejandroCasanas. All rights reserved.
//

import SpriteKit

class Fisherman {
    
    private var fisherman: SKSpriteNode!
    
    init () {
        fisherman = SKSpriteNode(imageNamed: "fisherman")
        fisherman.xScale = 1.25
        fisherman.yScale = 1.25
        fisherman.zPosition = 1
    }

    func setPosition(fishermanXPos: Double, fishermanYPos: Double){
        
        fisherman.position = CGPoint(x: fishermanXPos, y: fishermanYPos)
    }
    
    func getFishermanSpriteNode() -> SKSpriteNode{
        return fisherman
    }
}
