//
//  GameViewController.swift
//  ShakeGame
//
//  Created by Eugene Honcharenko on 22/11/24.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let skView = SKView(frame: self.view.frame)
        self.view.addSubview(skView)

        let scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
    }
}
