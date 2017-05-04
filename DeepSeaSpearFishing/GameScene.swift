//
//  GameScene.swift
//  DeepSeaSpearFishing
//
//  Created by ale on 4/23/17.
//  Copyright © 2017 AlejandroCasanas. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        
        initializingScrollingBackground()
        
        initPlayer()
    }
    
    func initializingScrollingBackground() {
        
        for i in 0...2 {
            let bg = SKSpriteNode(imageNamed: "bg_sea_morning")
            bg.position = CGPoint(x: i * Int(bg.size.width), y: 0)
            bg.zPosition = -15
            bg.anchorPoint = CGPoint.zero
            bg.name = "background"
            self.addChild(bg)
        }
    }
    
    func moveBackground() {
        
        let backgroundVelocity : CGFloat = 10
        
        self.enumerateChildNodes(withName: "background", using: { (node, stop) -> Void in
            if let bg = node as? SKSpriteNode {
                bg.position = CGPoint(x: bg.position.x - backgroundVelocity, y: bg.position.y)
                
                // Checks if bg node is completely scrolled off the screen, if yes, then puts it at the end of the other node.
                if bg.position.x <= -bg.size.width {
                    bg.position = CGPoint(x: bg.position.x + bg.size.width * 2, y: bg.position.y)
                }
            }
        })
    }
    
    
    func initPlayer() {
        
        //adding player
        let fishermanTexture = SKTexture(imageNamed: "fisherman")
        let fisherman = SKSpriteNode(texture: fishermanTexture)
        
        fisherman.xScale = 1.25
        fisherman.yScale = 1.25
        
        let fishermanXPosition = (self.scene?.size.width)! / 6
        let fishermanYPosition = (self.scene?.size.height)! / 2
        
        fisherman.position = CGPoint(x: fishermanXPosition, y: fishermanYPosition)
        
        fisherman.zPosition = 1
        
        self.addChild(fisherman)
    }
    

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        moveBackground()
    }
}
