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
        if self.targetHourInput.isFirstResponder {
            self.targetHourInput.resignFirstResponder()
        }
        guard let targetHourInput = self.targetHourInput.text,
            let hourAmount = Double(targetHourInput) else {
                return
        }
        guard let targetMinuteInput = self.targetMinuteInput.text,
            let minuteAmount = Double(targetMinuteInput) else {
                return
        }
        guard let targetSecondInput = self.targetSecondInput.text,
            let secondAmount = Double(targetSecondInput) else {
                return
        }
        guard let targetDistanceInput = self.targetDistanceInput.text,
            let distanceAmount = Double(targetDistanceInput) else {
                return
        }

        let totalMileTime = ((((hourAmount*120) + (minuteAmount*60) + (secondAmount))/distanceAmount) / 60)
        let totalLapTime = totalMileTime / 4
        targetMileOutput.text = String(totalMileTime)
        targetLapOutput.text = String(totalLapTime)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

}
