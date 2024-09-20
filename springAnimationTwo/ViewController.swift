//
//  ViewController.swift
//  springAnimationTwo
//
//  Created by Winky51 on 18.09.2024.
//

import UIKit
import SpringAnimation

final class ViewController: UIViewController {
    @IBOutlet weak var springAnimationView: SpringView!
    @IBOutlet weak var presetLabel: UILabel!
    @IBOutlet weak var curveLabel: UILabel!
    @IBOutlet weak var forceLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var delayLabel: UILabel!
    
    private var currentAnimation = ""
    private var nextSelectedAnimation = ""
    private let animationData = AnimationDataStore.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAnimation()
    }
    
    @IBAction func runButtonAction(_ sender: UIButton ) {
        
        guard sender.titleLabel?.text != "Run" else {
            startAnimation(sender)
            return
        }
        
        setAnimation()
        startAnimation(sender)
        
    }
    
    func setAnimation() {
        
        let curve = animationData.setRandomCurve()
        let force: CGFloat = .random(in: 0.5...2)
        let duration: CGFloat = .random(in: 0.5...3)
        let delay: CGFloat = .random(in: 0...1)
        
        nextSelectedAnimation = animationData.setRandomAnimation()
        
        if currentAnimation == "" {
            currentAnimation = animationData.setRandomAnimation()
        }
        
        springAnimationView.animation = currentAnimation
        springAnimationView.curve = curve
        springAnimationView.force = force
        springAnimationView.duration = duration
        springAnimationView.delay = delay
        
        presetLabel.text = currentAnimation
        curveLabel.text = curve
        forceLabel.text = String(format: "force: %.2f", force)
        durationLabel.text = String(format: "duration: %.2f", duration)
        delayLabel.text = String(format: "delay: %.2f", delay)
        
        print(springAnimationView.animation)
        
        currentAnimation = nextSelectedAnimation
        
        print(currentAnimation)
    }
    
    func startAnimation(_ sender: UIButton) {
        
        springAnimationView.animateNext {[unowned self] in
            sender.setTitle("Run: \(nextSelectedAnimation)", for: .normal)
            
        }
    }
}

