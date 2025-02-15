//
//  SnowFall.swift
//  TradeMySurf
//
//  Created by Marina Huber on 24.12.2024..
//  Copyright © 2024 Marina Huber. All rights reserved.
//

import SpriteKit

class SnowFall: SKScene {
    override func sceneDidLoad() {
        size = UIScreen.main.bounds.size
        anchorPoint = CGPoint(x: 0.5, y: 1)
        scaleMode = .resizeFill
        backgroundColor = .clear
        let node = SKEmitterNode(fileNamed: "snow.sks")!
        addChild(node)
        node.particlePositionRange.dx = UIScreen.main.bounds.width
    }
}
