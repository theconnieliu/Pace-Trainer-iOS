//
//  MainViewController.swift
//  Hackathon
//
//  Created by Tania Ortiz-Rosales on 7/16/18.
//  Copyright © 2018 Tania Ortiz-Rosales. All rights reserved.
//

import UIKit
import CoreData

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
    
    var runInfo: RunInfo?
    
    //Save Button
    @IBOutlet weak var saveButton: UIButton!
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        //experimenting
//        var runInfos = [RunInfo]()
        //{
//            didSet {
//                tableView.reloadData()
//            }
        //}

        
        
        // CORE DATA
        
        runInfo = CoreDataHelper.newRunInfo()
        
        runInfo?.miles = targetDistanceInput.text
        runInfo?.targetALT = targetLapOutput.text
        runInfo?.targetAMT = targetMileOutput.text
        runInfo?.elapsedHours = elapsedHourInput.text
        runInfo?.elapsedMinutes = elapsedMinuteInput.text
        runInfo?.elapsedSeconds = elapsedSecondInput.text
        runInfo?.targetHours = targetHourInput.text
        runInfo?.targetMinutes = targetMinuteInput.text
        runInfo?.targetSeconds = targetSecondInput.text
        runInfo?.modificationTime = Date()
        
//        let context = CoreDataHelper.context
//        let runInfo = NSEntityDescription.insertNewObject(forEntityName: "RunInfo", into: context)
//
//        // Saving the values in our textfields into Core Data
//        runInfo.setValue(targetHourInput.text , forKey: "targetHours")
//        runInfo.setValue(targetMinuteInput.text, forKey: "targetMinutes")
//        runInfo.setValue(targetSecondInput.text, forKey: "targetSeconds")
//        runInfo.setValue(elapsedHourInput.text, forKey: "elapsedHours")
//
//        // Saving the values in our labels into Core Data
//        runInfo.setValue(elapsedMinuteInput.text, forKey: "elapsedMinutes")
//        runInfo.setValue(elapsedSecondInput.text, forKey: "elapsedSeconds")
//        runInfo.setValue(targetDistanceInput.text, forKey: "miles")
//        runInfo.setValue(targetMileOutput.text, forKey: "targetAMT")
//        runInfo.setValue(targetLapOutput.text, forKey: "targetALT")
        
        
        CoreDataHelper.saveRunInfo()
        
        //Here, we want to save the runInfo Object first
        print(" Did anything save: \(runInfo)")
        self.performSegue(withIdentifier: "saveStat", sender: self)
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
        if self.targetSecondInput.isFirstResponder {
            self.targetSecondInput.resignFirstResponder()
        }
        if self.targetMinuteInput.isFirstResponder {
            self.targetMinuteInput.resignFirstResponder()
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let displayAllInfoViewController = segue.destination as? DisplayAllInfoViewController
//        displayAllInfoViewController?.runInfo = runInfo
        let listStatsTableViewController = segue.destination as? ListStatsTableViewController
        guard let unwrappedRunInfo = runInfo else { return }
        print(unwrappedRunInfo)
        listStatsTableViewController?.runInfos.append(unwrappedRunInfo)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        // Do any additional setup after loading the view.
    }

    

}
