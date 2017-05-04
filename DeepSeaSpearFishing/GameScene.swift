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
        
        displaySpearAmountLeft()
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
        let fisherman: Fisherman = Fisherman()
        
        let fishermanXPosition = (self.scene?.size.width)! / 6
        let fishermanYPosition = (self.scene?.size.height)! / 2
        
        fisherman.setPosition(fishermanXPos: Double(fishermanXPosition), fishermanYPos: Double(fishermanYPosition))
        
        self.addChild(fisherman.getFishermanSpriteNode())
    }
    
  
    func displaySpearAmountLeft(){
        
        //keeping score
//        var spearAmount = 20
        let spearAmountText = SKLabelNode(fontNamed: "Chalkduster")
        
        let spearAmountTextXPosition = (self.scene?.size.width)! * 0.30
        let spearAmountTextYPosition = (self.scene?.size.height)! / 1.08
        
        spearAmountText.position = CGPoint( x: spearAmountTextXPosition, y: spearAmountTextYPosition);
        spearAmountText.zPosition = 1
        spearAmountText.fontSize = 25
        spearAmountText.text = "20"
        
        self.addChild(spearAmountText)
    }
    
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        
//        for touch: AnyObject in touches {
//            
//            let location = touch.location(in: self)
//            let thisNode = self.atPoint(location)
//            
//            
//            if (thisNode.name != nil) {
//                
//                //shoot a spear if the shoot button is pressed
//                if (thisNode.name == "shootButton"){
//                    
////                    addSpear()
//                    
//                    //if something else is pressed move player to that position
//                    
//                } else {
//                    
//                    print(location.y)
//                    
//                    //set the new position
////                    var newPosition = CGPoint(x: 23, y: location.y)
//                    
////                    if (newPosition.y < player.size.height/2){
////                        
////                        newPosition.y = player.size.height/2
////                    }
////                    
////                    if (newPosition.y > self.size.height - player.size.width/6) {
////                        
////                        newPosition.y = self.size.height - player.size.width/6
////                    }
////                    
////                    
////                    //update player position
////                    player.position.y = newPosition.y;
////                    
//                    
//                }
//            }
//            
//        }
//    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        moveBackground()
    }
}
