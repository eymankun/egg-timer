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
    
    @IBOutlet weak var progressView: UIProgressView!
    
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
        print("boiling time is \(boilingTime)")
        counter = boilingTime
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        let hardness = sender.currentTitle
        
        if let time = eggTime[hardness!] {
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
                print(self.counter)
                self.counter -= 1
            } else {
                timer.invalidate()
//                print("Boiling is done.")
                self.alertShow(title: "Boiling is done.", message: self.eggTime[hardness!])
            }
        }
    }
    
}

 
