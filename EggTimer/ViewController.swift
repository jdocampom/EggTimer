//
//  ViewController.swift
//  EggTimer
//
//  Created by Juan Diego Ocampo on 08/07/2019.
//  Copyright © 2019 Juan Diego Ocampo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
// MARK: Variables and Constants
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()
    
// MARK: IB-Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
// MARK: Methods
    
    /// Tag: hardnessSelected()
    @IBAction func hardnessSelected(_ sender: UIButton) {
        /// Inmediatly resets timer after the button gets tapped.
        progressBar.progress = 0.0
        secondsPassed = 0
        timer.invalidate()
        /// This bit of code detects which button did the user press.
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        /// Countdown begins...
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        titleLabel.text = hardness
    }
    
    /// Tag: updateTimer()
    @objc func updateTimer() {
        /// Countdown begins...
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed)/Float(totalTime)
        } else {
        /// Countdown getd void after reaching the end...
            timer.invalidate()
            titleLabel.text = "Done!"
        }
    }
}
