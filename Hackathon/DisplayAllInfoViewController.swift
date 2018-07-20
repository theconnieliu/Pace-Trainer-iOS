//
//  DisplayAllInfoViewController.swift
//  Hackathon
//
//  Created by Tania Ortiz-Rosales on 7/18/18.
//  Copyright © 2018 Tania Ortiz-Rosales. All rights reserved.
//

import UIKit

class DisplayAllInfoViewController: UIViewController {

    @IBOutlet weak var targetDistanceLabel: UILabel!
    @IBOutlet weak var targetTimeLabel: UILabel!
    @IBOutlet weak var targetMinuteLabel: UILabel!
    @IBOutlet weak var targetSecondLabel: UILabel!
    @IBOutlet weak var averageMileTimeLabel: UILabel!
    @IBOutlet weak var averageLapTimeNeeded: UILabel!
    @IBOutlet weak var actualMileTimeLabel: UILabel!
    @IBOutlet weak var actualMinuteTimeLabel: UILabel!
    @IBOutlet weak var actualSecondTimeLabel: UILabel!
    
    
//    var stat: Stat?
    var runInfo: RunInfo?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        targetDistanceLabel.text = runInfo?.miles
        targetTimeLabel.text = runInfo?.targetHours
        targetMinuteLabel.text = runInfo?.targetMinutes
        targetSecondLabel.text = runInfo?.targetSeconds
        averageMileTimeLabel.text = runInfo?.targetAMT
        averageLapTimeNeeded.text = runInfo?.targetALT
        actualMileTimeLabel.text = runInfo?.elapsedHours
        actualMinuteTimeLabel.text = runInfo?.elapsedMinutes
        actualSecondTimeLabel.text = runInfo?.elapsedSeconds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let unwrappedRunInfo = runInfo {
            unwrappedRunInfo.miles = targetDistanceLabel.text
            unwrappedRunInfo.targetALT = averageLapTimeNeeded.text
            unwrappedRunInfo.targetAMT = averageMileTimeLabel.text
            unwrappedRunInfo.elapsedHours = actualMileTimeLabel.text
            unwrappedRunInfo.elapsedMinutes = actualMinuteTimeLabel.text
            unwrappedRunInfo.elapsedSeconds = actualSecondTimeLabel.text
            unwrappedRunInfo.targetHours = targetTimeLabel.text
            unwrappedRunInfo.targetMinutes = targetMinuteLabel.text
            unwrappedRunInfo.targetSeconds = targetSecondLabel.text
        } else {
            targetDistanceLabel.text = ""
            targetTimeLabel.text = ""
            averageMileTimeLabel.text = ""
            averageLapTimeNeeded.text = ""
            actualMileTimeLabel.text = ""
        }//if else
    }//view will appear
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let identifier = segue.identifier else { return }
//        
//        switch identifier {
//        case "saveStat" where stat != nil:
//            stat?.targetDistance = targetDistanceLabel.text ?? ""
//            stat?.targetTime = targetTimeLabel.text ?? ""
//            stat?.averageMileTime = averageMileTimeLabel.text ?? ""
//            stat?.averageLapTime = averageLapTimeNeeded.text ?? ""
//            stat?.actualMileTime = actualMileTimeLabel.text ?? ""
//            stat?.modificationTime = Date()
//            CoreDataHelper.saveStat()
//            
//        case "saveStat" where stat == nil:
//            let stat = CoreDataHelper.newStat()
//            stat.targetDistance = targetDistanceLabel.text ?? ""
//            stat.targetTime = targetTimeLabel.text ?? ""
//            stat.averageMileTime = averageMileTimeLabel.text ?? ""
//            stat.averageLapTime = averageLapTimeNeeded.text ?? ""
//            stat.actualMileTime = actualMileTimeLabel.text ?? ""
//            stat.modificationTime = Date()
//            CoreDataHelper.saveStat()
//            
//        default:
//            print("unexpected segue identifier")
//        }
//    }

}

