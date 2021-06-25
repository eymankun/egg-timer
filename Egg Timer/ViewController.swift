//
//  ViewController.swift
//  Egg Timer
//
//  Created by Aiman on 2021/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTime = ["Soft": 5, "Medium": 8, "Hard": 12]
    var timer = Timer()
    var counter = 0
    var secondsPassed = 0.0
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressView.progress = 0.0
    }
    
    func alertShow(title: String?, message: Int?) {
        let alert = UIAlertController(title: title, message: "boiling time is \(message!).", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
        })
        alert.addAction(ok)
        
        DispatchQueue.main.async(execute: {
            self.present(alert, animated: true)
        })
    }
    
    func printAndCountdown(boilingTime: Int) {
//        print("boiling time is \(boilingTime)")
        
        counter = boilingTime
        secondsPassed = 0.0
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        let hardness = sender.currentTitle
        let timeToBoil = eggTime[hardness!]
        
        if let time = timeToBoil {
            switch hardness {
            case "Soft":
                printAndCountdown(boilingTime: time)
            case "Medium":
                printAndCountdown(boilingTime: time)
            case "Hard":
                printAndCountdown(boilingTime: time)
            default:
                print("Please select egg hardness.")
            }
        }
        
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if self.counter > 0 {
                print(self.secondsPassed)
                print(self.counter)
                print(timeToBoil!)
                self.counter -= 1
                self.secondsPassed += 1
                self.progressView.progress = Float(self.secondsPassed) / Float(timeToBoil!)
                
            } else {
                timer.invalidate()
//                print("Boiling is done.")
                self.alertShow(title: "Boiling is done.", message: self.eggTime[hardness!])
            }
        }
    }
    
}

 
