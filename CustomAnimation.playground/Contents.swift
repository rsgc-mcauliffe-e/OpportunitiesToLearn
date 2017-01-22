//: Playground - noun: a place where people can play

import Cocoa
import SpriteKit
import PlaygroundSupport

let frame = CGRect(x: 0, y: 0, width: 320, height: 256)
let midPoint = CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0)

var scene = SKScene(size: frame.size)

let bground = SKSpriteNode(imageNamed: "ovalOffice.jpg")

let bill = SKSpriteNode(imageNamed: "hqdefault")
let frog = SKSpriteNode(imageNamed: "forg.jpg")
bground.position = midPoint
bground.zPosition = 0 //ensures the background is the furthest back object
frog.position = midPoint
bill.position = midPoint
frog.setScale(0.3)
bill.setScale(0.3)

let wait = SKAction.wait(forDuration: 10)

let rotate = SKAction.rotate(byAngle: 3*(CGFloat.pi), duration: 3)

let actionMoveUp = SKAction.moveBy(x: 0, y: 40, duration: 1)
let actionMoveDown = SKAction.moveBy(x: 0, y: -40, duration: 1)
let actionSequence = SKAction.sequence([actionMoveUp, actionMoveDown, rotate])
let actionRepeat = SKAction.repeatForever(actionSequence)

bill.run(actionRepeat)
bill.zPosition = 2  // Ensure sprite is above background and frog


scene.addChild(bill) // Add to the scene
scene.addChild(bground)
scene.addChild(frog)

//: Make bill even happier!
let actionPlaySound = SKAction.playSoundFileNamed("ClintonBill.mp3", waitForCompletion: true)

let replaySong = SKAction.repeatForever(actionPlaySound)

scene.run(replaySong)

//: And show the scene in the liveView

let view = SKView(frame: frame)
view.presentScene(scene)
PlaygroundPage.current.liveView = view
