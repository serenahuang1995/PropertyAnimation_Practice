//
//  ViewController.swift
//  UIViewPropertyAnimator
//
//  Created by 黃瀞萱 on 2022/3/18.
//

import UIKit

class ViewController: UIViewController {
    
    var animator = UIViewPropertyAnimator()

    @IBOutlet weak var aniView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        startAnimationnnn()
//        animator = UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 1.0, delay: 0.5, options: [.curveLinear, .repeat, .autoreverse], animations: { [unowned self] in
//            self.aniView.layer.cornerRadius = aniView.frame.width / 2
//            self.aniView.alpha = 0.5
//            self.aniView.center.y += 300
//            self.aniView.transform = CGAffineTransform(rotationAngle: .pi)
//        })
        
        UIView.animate(withDuration: 10, delay: 0, options: [.repeat, .curveLinear, .autoreverse]) { [unowned self] in
            self.aniView.layer.cornerRadius = aniView.frame.width / 2
            self.aniView.alpha = 0.5
            self.aniView.center.y += 300
            self.aniView.transform = CGAffineTransform(rotationAngle: .pi)
        }
//
//        startAnimationnnn()
    }
    
    @IBAction func start(_ sender: Any) {
//        animator = UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 10, delay: 0, options: [.curveLinear, .repeat, .autoreverse], animations: { [unowned self] in
//            self.aniView.layer.cornerRadius = aniView.frame.width / 2
//            self.aniView.alpha = 0.5
//            self.aniView.center.y += 300
//            self.aniView.transform = CGAffineTransform(rotationAngle: .pi)
//        })
        animator.isReversed = false
        animator.startAnimation()
        
    }
    
    @IBAction func pause(_ sender: Any) {
        animator.pauseAnimation()
    }
    
    @IBAction func stop(_ sender: Any) {
        animator.stopAnimation(false)
        animator.finishAnimation(at: .end)
        
    }
    
    
    @IBAction func reverse(_ sender: Any) {
        animator.isReversed = true
    }
    
    private func startAnimationnnn() {
//        animator = UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 1.0, delay: 0.0, options: [.curveLinear, .repeat], animations: { [unowned self] in
//            self.aniView.layer.cornerRadius = aniView.frame.width / 2
//            self.aniView.alpha = 0.5
//            self.aniView.center.y += 300
//            self.aniView.transform = CGAffineTransform(rotationAngle: .pi)
//        })
        
        animator = UIViewPropertyAnimator(duration: 10, curve: .linear) { [unowned self] in
            self.aniView.layer.cornerRadius = aniView.frame.width / 2
            self.aniView.alpha = 0.5
            self.aniView.center.y += 300
            self.aniView.transform = CGAffineTransform(rotationAngle: .pi)
        }
        
        animator.addAnimations {
            print("add animation")
            self.aniView.backgroundColor = .red
        }
        
        animator.addCompletion { [unowned self] position in
            print("end animation")
            print("position : \(position.rawValue)")
            self.aniView.backgroundColor = .brown
        }
        
//        animator.continueAnimation(withTimingParameters: .none, durationFactor: 1)
        
        animator.continueAnimation(withTimingParameters: UISpringTimingParameters(dampingRatio: 0.5), durationFactor: 1)

        animator.startAnimation()
    }

}

