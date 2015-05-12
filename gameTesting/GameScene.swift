//
//  GameScene.swift
//  gameTesting
//
//  Created by Anil on 12/05/15.
//  Copyright (c) 2015 Variya Soft Solutions. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let bg = SKSpriteNode(imageNamed: "bg")
    let play = SKSpriteNode(imageNamed: "start")
    
    let hero1 = SKSpriteNode(imageNamed: "Hero1")
    let hero2 = SKSpriteNode(imageNamed: "Hero2")
    let hero3 = SKSpriteNode(imageNamed: "Hero3")
    
    var heroSelected = false
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        addBG()
        addPlay()
        addlbl()
        addHeros()
    }
    
    func addBG() {
        //Add your backGround
        bg.position = CGPointMake(self.size.width/2, self.size.height/2)
        bg.size = view!.bounds.size
        addChild(bg)
    }
    
    func addPlay() {
        //Add play button
        play.position = CGPointMake(self.size.width/2, self.size.height/2 - 100)
        addChild(play)
    }
    
    func addlbl(){
        //add lbl
        let label = SKLabelNode(fontNamed: "Chalkduster")
        label.text = "Select your player first"
        label.fontSize = 20
        label.fontColor = SKColor.blackColor()
        label.position = CGPoint(x: size.width/2 , y: size.height - 20)
        addChild(label)
    }
    
    func addHeros() {
        //add 3 heros
        hero1.position = CGPointMake(self.size.width/2 - 40, self.size.height/2)
        hero2.position = CGPointMake(self.size.width/2, self.size.height/2)
        hero3.position = CGPointMake(self.size.width/2 + 40, self.size.height/2)
        addChild(hero1)
        addChild(hero2)
        addChild(hero3)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch in (touches as! Set<UITouch>) {
            let location = touch.locationInNode(self)
            
            switch self.nodeAtPoint(location) {
                
            case self.hero1:
                NSUserDefaults().setObject("Hero1", forKey: "SelectedHero") //this way u can set value for selected hero
                heroSelected = true
                println("Hero1 Selected")
            case self.hero2:
                NSUserDefaults().setObject("Hero2", forKey: "SelectedHero")
                println("Hero2 Selected")
                heroSelected = true
            case self.hero3:
                NSUserDefaults().setObject("Hero3", forKey: "SelectedHero")
                println("Hero3 Selected")
                heroSelected = true
            default:
                println("Hero not selected")
            }
            
            if self.nodeAtPoint(location) == self.play {
                
                if heroSelected {
                    //if hero selected you can go to next scene
                    let reveal = SKTransition.flipHorizontalWithDuration(0.5)
                    let letsPlay = playScene(size: self.size)
                    self.view?.presentScene(letsPlay, transition: reveal)
                } else {
                    //if not seleted you can set warning
                    println("Select Hero first")
                }
            }
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
