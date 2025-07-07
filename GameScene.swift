//
//  GameScene.swift
//  FindTheMemory
//
//  Created by Kirsch Garrix on 2025/7/7.
//

// SpriteKit 剧情小游戏第一阶段完整可运行【macOS 适配版】
import SpriteKit

class MainMenuScene: SKScene {
    override func didMove(to view: SKView) {
        backgroundColor = .black
        let label = SKLabelNode(text: "点击开始游戏")
        label.fontName = "Menlo-Bold"
        label.fontSize = 40
        label.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(label)
    }
    override func mouseDown(with event: NSEvent) {
        let storyScene = StoryScene(size: size)
        storyScene.scaleMode = .resizeFill
        view?.presentScene(storyScene, transition: .fade(withDuration: 1))
    }
}

class StoryScene: SKScene {
    let dialogues = ["你醒来了……","这里是哪里？","快跑！它来了！","（点击进入小游戏）"]
    var index = 0
    let label = SKLabelNode(fontNamed: "Menlo-Bold")

    override func didMove(to view: SKView) {
        backgroundColor = .black
        label.fontSize = 28
        label.position = CGPoint(x: frame.midX, y: frame.midY)
        label.numberOfLines = 0
        label.preferredMaxLayoutWidth = frame.width - 40
        label.text = dialogues[index]
        addChild(label)
    }
    override func mouseDown(with event: NSEvent) {
        index += 1
        if index < dialogues.count {
            label.text = dialogues[index]
        } else {
            let miniGame = MiniGameScene(size: size)
            miniGame.scaleMode = .resizeFill
            view?.presentScene(miniGame, transition: .fade(withDuration: 1))
        }
    }
}

class MiniGameScene: SKScene {
    override func didMove(to view: SKView) {
        backgroundColor = .darkGray
        let label = SKLabelNode(text: "小游戏中... 点击完成")
        label.fontName = "Menlo-Bold"
        label.fontSize = 28
        label.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(label)
    }
    override func mouseDown(with event: NSEvent) {
        let gameOver = GameOverScene(size: size)
        gameOver.scaleMode = .resizeFill
        view?.presentScene(gameOver, transition: .fade(withDuration: 1))
    }
}

class GameOverScene: SKScene {
    override func didMove(to view: SKView) {
        backgroundColor = .black
        let label = SKLabelNode(text: "游戏结束，点击返回主菜单")
        label.fontName = "Menlo-Bold"
        label.fontSize = 28
        label.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(label)
    }
    override func mouseDown(with event: NSEvent) {
        let menu = MainMenuScene(size: size)
        menu.scaleMode = .resizeFill
        view?.presentScene(menu, transition: .fade(withDuration: 1))
    }
}
