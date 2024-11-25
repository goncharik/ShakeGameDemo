import CoreMotion
import SpriteKit

class GameScene: SKScene {
    let motionManager = CMMotionManager()
    var balls: [SKShapeNode] = []

    override func didMove(to _: SKView) {
        physicsWorld.gravity = CGVector(dx: 0, dy: -9.8) // Simulate gravity
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame) // Screen edges

        createBalls()
        setupDeviceMotion()
    }

    func createBalls() {
        let ballRadius: CGFloat = 20.0

        for _ in 0 ..< 10 {
            let ball = SKShapeNode(circleOfRadius: ballRadius)
            ball.fillColor = .random()
            ball.strokeColor = .black
            ball.lineWidth = 1

            let randomX = CGFloat.random(in: ballRadius ... (size.width - ballRadius))
            let randomY = CGFloat.random(in: (size.height / 2) ... (size.height - ballRadius))
            ball.position = CGPoint(x: randomX, y: randomY)

            ball.physicsBody = SKPhysicsBody(circleOfRadius: ballRadius)
            ball.physicsBody?.restitution = 0.8 // Bounciness
            ball.physicsBody?.friction = 0.1
            ball.physicsBody?.allowsRotation = true
            ball.physicsBody?.linearDamping = 0.1
            ball.physicsBody?.mass = 0.5

            addChild(ball)
            balls.append(ball)
        }
    }

    func setupDeviceMotion() {
        if motionManager.isAccelerometerAvailable {
            motionManager.accelerometerUpdateInterval = 1.0 / 60.0 // 60 updates per second
            motionManager.startAccelerometerUpdates(to: .main) { [weak self] data, _ in
                guard let self, let accelerometerData = data else { return }
                let gravity = CGVector(
                    dx: accelerometerData.acceleration.x * 9.8,
                    dy: accelerometerData.acceleration.y * 9.8
                )
                physicsWorld.gravity = gravity
            }
        }
    }

    override func update(_: TimeInterval) {
        // Called before each frame is rendered
        // Game loop logic can be added here if needed
    }
}

extension UIColor {
    static func random() -> UIColor {
        UIColor(
            red: .random(in: 0 ... 1),
            green: .random(in: 0 ... 1),
            blue: .random(in: 0 ... 1),
            alpha: 1.0
        )
    }
}
