//: Playground - noun: a place where people can play

import Cocoa
import SpriteKit
import PlaygroundSupport

let frame = CGRect(x: 0, y: 0, width: 320, height: 256)
let midPoint = CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0)

var scene = SKScene(size: frame.size)

let bill = SKSpriteNode(imageNamed: "hqdefault")
let forg = SKSpriteNode(imageNamed: "forg.jpg")
forg.position = midPoint
bill.position = midPoint
forg.setScale(0.3)
bill.setScale(0.3)

let wait = SKAction.wait(10)

let rotate = SKAction.rotate(byAngle: 3*(CGFloat.pi), duration: 3)

let actionMoveUp = SKAction.moveBy(x: 0, y: 40, duration: 1)
let actionMoveDown = SKAction.moveBy(x: 0, y: -40, duration: 1)
let actionSequence = SKAction.sequence([actionMoveUp, actionMoveDown, rotate])
let actionRepeat = SKAction.repeatForever(actionSequence)

bill.run(actionRepeat)
bill.zPosition = 10  // Ensure sprite is above background
scene.addChild(bill) // Add to the scene


//: Make Nyan Cat even happier!
let actionPlaySound = SKAction.playSoundFileNamed("ClintonBill.mp3", waitForCompletion: true)

let replaySong = SKAction.repeatForever(actionPlaySound)

scene.run(replaySong)

//: And show the scene in the liveView

let view = SKView(frame: frame)
view.presentScene(scene)
PlaygroundPage.current.liveView = view
