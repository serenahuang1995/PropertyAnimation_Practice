//
//  SecViewController.swift
//  UIViewPropertyAnimator
//
//  Created by 黃瀞萱 on 2022/4/7.
//

import UIKit

class SecViewController: UIViewController {
    
    var planeAnimator = UIViewPropertyAnimator(duration: 5, curve: .linear)
    var labelAnimator = UIViewPropertyAnimator(duration: 2, curve: .easeIn)
    let plane = UIImageView()
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupImageAndLabel()
        setupPlaneAnimation()
    }
    
    @IBAction func startAnimation(_ sender: UIButton) {
        planeAnimator.startAnimation()
    }
    
    @IBAction func pauseAnimation(_ sender: UIButton) {
        planeAnimator.pauseAnimation()
    }
    
    @IBAction func stopAnimation(_ sender: UIButton) {
        planeAnimator.stopAnimation(true)
        planeAnimator.finishAnimation(at: .start) // 設定動畫停止之後要回到哪個位置
    }    

    @IBAction func reverseAnimation(_ sender: UIButton) {
        sender.tag += 1
        
        if sender.tag % 2 == 1 {
            planeAnimator.isReversed = true
        } else {
            planeAnimator.isReversed = false
        }
    }
    
    func setupImageAndLabel() {
        
        plane.image = UIImage(named: "plane")
        label.text = "Safe Flight!"
        label.alpha = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 30)
        
        [plane, label].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            plane.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            plane.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            plane.heightAnchor.constraint(equalToConstant: 300),
            
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setupPlaneAnimation() {
        
        planeAnimator.addAnimations { [unowned self] in
            self.plane.alpha = 0
            self.plane.frame.origin.x += 100
        }
        
        planeAnimator.addCompletion { [unowned self] _ in
            self.setupLabelAnimation()
        }
        
        planeAnimator.startAnimation()
    }
    
    func setupLabelAnimation() {
        
        labelAnimator = UIViewPropertyAnimator.runningPropertyAnimator(
            withDuration: 3, delay: 0.0,
            options: [.autoreverse, .repeat, .curveEaseIn],
            animations: { [unowned self] in
                self.label.alpha = 1
                self.label.textColor = .brown
            })
    }

}
