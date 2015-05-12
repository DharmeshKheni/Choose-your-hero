//
//  PlayScene.swift
//  gameTesting
//
//  Created by Anil on 12/05/15.
//  Copyright (c) 2015 Variya Soft Solutions. All rights reserved.
//

import Foundation
import SpriteKit

class playScene : SKScene {
    
    let bg = SKSpriteNode(imageNamed: "bg")
    let selectedPlayer = NSUserDefaults().objectForKey("SelectedHero") as! String  //get the name of selected hero
    
    
    override func didMoveToView(view: SKView) {
        
        addBG()
        addPlayer()
    }
    
    func addBG() {
        
        bg.position = CGPointMake(self.size.width/2, self.size.height/2)
        bg.size = view!.bounds.size
        addChild(bg)
    }
    
    func addPlayer() {
        //add your selected player
        let player = SKSpriteNode(imageNamed: selectedPlayer)
        player.position = CGPointMake(self.size.width/2, self.size.height/2)
        addChild(player)
    }
}