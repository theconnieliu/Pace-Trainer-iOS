//
//  MainViewController.swift
//  Hackathon
//
//  Created by Tania Ortiz-Rosales on 7/16/18.
//  Copyright © 2018 Tania Ortiz-Rosales. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var calculateButton: UIButton!
    
    //Target Parameters View
    @IBOutlet weak var targetDistanceInput: UITextField!
    @IBOutlet weak var targetHourInput: UITextField!
    @IBOutlet weak var targetMinuteInput: UITextField!
    @IBOutlet weak var targetSecondInput: UITextField!
    
    //Target Averages View
    @IBOutlet weak var targetMileOutput: UILabel!
    @IBOutlet weak var targetLapOutput: UILabel!
    
    //Elapsed Time VIew
    @IBOutlet weak var elapsedHourInput: UITextField!
    @IBOutlet weak var elapsedMinuteInput: UITextField!
    @IBOutlet weak var elapsedSecondInput: UITextField!
    
    //Save Button
    @IBOutlet weak var saveButton: UIButton!
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        //experimenting
        print("Save Button Tapped")
    }
    
    
    @IBAction func calculateButtonTapped(_ sender: Any) {
       calculate()
    }
    
    func calculate() {
        var secondAmount: Double = 0
        var minuteAmount: Double = 0
        var hourAmount: Double = 0
        var distanceAmount: Double = 0
        
        if self.targetHourInput.isFirstResponder {
            self.targetHourInput.resignFirstResponder()
        }

        if let secondsText = targetSecondInput.text {
            if secondsText.isEmpty {
                secondAmount = 0
            } else {
                secondAmount = Double(secondsText) ?? 0
            }
        }
        
        if let minutesText = targetMinuteInput.text {
            if minutesText.isEmpty {
                minuteAmount = 0
            } else {
                minuteAmount = Double(minutesText) ?? 0
            }
        }
        
        if let hoursText = targetHourInput.text {
            if hoursText.isEmpty {
                hourAmount = 0
            } else {
                hourAmount = Double(hoursText) ?? 0
            }
        }
        
        if let distanceText = targetDistanceInput.text {
            if distanceText.isEmpty {
                distanceAmount = 0
            } else {
                distanceAmount = Double(distanceText) ?? 0
            }
        }

        let totalMileTime = ((((hourAmount*60*60) + (minuteAmount*60) + (secondAmount))/distanceAmount) / 60)
        
        let totalMile = String(format: "%.2f", totalMileTime)
        let totalLapTime = totalMileTime / 4
        let totalLap = String(format: "%.2f", totalLapTime)
        
//      seperating the values to turn the fraction of a minute into actual seconds
        let parsedTime:[String] = String(totalMile).components(separatedBy: ".")
        let finalMinutes = parsedTime[0]
        let fractionSeconds: String = ((".")+parsedTime[1])
        let finalSeconds: Double = Double(fractionSeconds)!*60
//      for lap time
        let parsedTimeL:[String] = String(totalLap).components(separatedBy: ".")
        let finalMinutesL = parsedTimeL[0]
        let fractionSecondsL: String = ((".")+parsedTimeL[1])
        let finalSecondsL: Double = Double(fractionSecondsL)!*60
        
        targetMileOutput.text = String(finalMinutes + ":" + String(finalSeconds))
        targetLapOutput.text = String(finalMinutesL + ":" + String(finalSecondsL))
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

}
