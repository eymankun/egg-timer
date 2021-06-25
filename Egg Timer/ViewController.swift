//
//  ViewController.swift
//  Egg Timer
//
//  Created by Aiman on 2021/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTime = ["Soft": 300, "Medium": 480, "Hard": 720]
    var timer = Timer()
    var counter = 0
    var secondsPassed = 0.0
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressView.progress = 0.0
    }
    
    //TODO: Create alert when the time is done
    func alertShow(title: String?, message: Int?) {
        let alert = UIAlertController(title: title, message: "boiling time is \(message!) minutes.", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
        })
        alert.addAction(ok)
        
        DispatchQueue.main.async(execute: {
            self.present(alert, animated: true)
        })
    }
    
    //TODO: print the boiling time to label, and set countdown time. also reset the secondsPassed to 0
    func printAndCountdown(boilingTime: Int) {
//        print("boiling time is \(boilingTime)")
        label.text = "boiling time is \(boilingTime) minutes"
        counter = boilingTime
        secondsPassed = 0.0
    }
    
    //TODO: timer func. fire time every 1 sec and update progress bar. also trigger alert when timer is done
    func boilEggTimer(timeToBoil: Int?) {
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if self.counter > 0 {
//                print(self.secondsPassed)
//                print(self.counter)
//                print(timeToBoil!)
                self.counter -= 1
                self.secondsPassed += 1
                self.progressView.progress = Float(self.secondsPassed) / Float(timeToBoil!)
                
            } else {
                timer.invalidate()
//                print("Boiling is done.")
                self.alertShow(title: "Boiling is done.", message: timeToBoil)
                self.label.text = "How do you like your eggs?"
            }
        }
    }
    
    //TODO: when one of the button is pressed, the text on the button will triggered the timer
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
        boilEggTimer(timeToBoil: timeToBoil)
    }
    
}

 
