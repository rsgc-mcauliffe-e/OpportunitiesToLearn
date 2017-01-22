//: Playground - noun: a place where people can play

import Cocoa
import SpriteKit
import PlaygroundSupport

let frame = CGRect(x: 0, y: 0, width: 320, height: 256)// sets the size of the canvas
let midPoint = CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0)// finds the precise center of the canvas

var scene = SKScene(size: frame.size)//initializes scene

let bground = SKSpriteNode(imageNamed: "ovalOffice.jpg")//imports image for background

let bill = SKSpriteNode(imageNamed: "hqdefault")//imports bill's image
let frog = SKSpriteNode(imageNamed: "forg.png")// imports picture of frog

//ensures the background is the furthest back object and that it is centred in the scene
bground.position = midPoint
bground.zPosition = 0

// places frog and sets size
frog.position = CGPoint(x: 400, y: 10)
frog.setScale(0.3)
//places bill and sets size
bill.position = midPoint
bill.setScale(0.3)

// action to wait 10 seconds used by both the frog and bill
let wait = SKAction.wait(forDuration: 10)

// bill's actions
let rotate = SKAction.rotate(byAngle: 3*(CGFloat.pi), duration: 3) // rotates bill 1.5 times
let actionMoveUp = SKAction.moveBy(x: 0, y: 40, duration: 1)//moves bill up
let actionMoveDown = SKAction.moveBy(x: 0, y: -40, duration: 1)//moves bill down
let actionSequence = SKAction.sequence([actionMoveUp, actionMoveDown, rotate])// creates one smooth animation sequence of bill bouncing and rotating
let billActionRepeat = SKAction.repeatForever(actionSequence)//states that the bill animation should repeat forever


// frog's actions
let actionFlyUp = SKAction.moveBy(x: -400, y: 200, duration: 7)// moves the frog diagonally across the screen
let actionFlyRight = SKAction.moveBy(x: 275, y: 0, duration: 1) // moves the frog along the x axis
let actionFlyDown = SKAction.moveBy(x: 0, y: -250, duration: 10)//moves the frog down along the y axis
let actionHome = SKAction.move(to: CGPoint(x: 400, y: 10), duration: 0)//returns the frog to it's original location so the other animations always look the same
let frogActionFlyAroundForever = SKAction.repeatForever(SKAction.sequence([actionFlyUp, wait, actionFlyRight, actionFlyDown, actionHome]))// creates a smooth animation sequence that loops forever

bill.run(billActionRepeat)// runs the animation sequence for bill
frog.run(frogActionFlyAroundForever)// runs animaiton sequence for frog


bill.zPosition = 2  // Ensure bill is above background and frog
frog.zPosition = 1// ensures frog is behind bill but above the background

scene.addChild(bill) // Adds bill to the scene
scene.addChild(bground)// adds background to scene
scene.addChild(frog)// adds frog to scene

//play background music of bill
let actionPlaySound = SKAction.playSoundFileNamed("ClintonBill.mp3", waitForCompletion: true)

let replaySong = SKAction.repeatForever(actionPlaySound)// loop song forever and ever and ever

scene.run(replaySong)

//show the scene in the liveView

let view = SKView(frame: frame)
view.presentScene(scene)
PlaygroundPage.current.liveView = view
