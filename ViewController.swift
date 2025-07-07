//
//  ViewController.swift
//  FindTheMemory
//
//  Created by Kirsch Garrix on 2025/7/7.
//

import Cocoa
import SpriteKit
import GameplayKit

class ViewController: NSViewController {

    @IBOutlet var skView: SKView!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let view = self.skView {
            // ✅ 加载 MainMenuScene 替代默认 .sks
            let scene = MainMenuScene(size: view.bounds.size)
            scene.scaleMode = .resizeFill
            view.presentScene(scene)

            // 可选调试显示 FPS 和节点数
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
}
