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
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        let hardness = sender.currentTitle
        
        if let boilingTime = eggTime[hardness!] {
            switch hardness {
            case "Soft":
                print("boiling time is \(boilingTime)")
            case "Medium":
                print("boiling time is \(boilingTime)")
            case "Hard":
                print("boiling time is \(boilingTime)")
            default:
                print("Please select egg hardness.")
            }
        }
        
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.counter += 1
            print(self.counter)
            if self.counter == self.eggTime[hardness!] {
                timer.invalidate()
                print("Boiling is done")
            }
        }
    }
    
}

 
