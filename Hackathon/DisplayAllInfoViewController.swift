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
        targetDistanceLabel.text = ""
        targetTimeLabel.text = ""
        targetMinuteLabel.text = ""
        targetSecondLabel.text = ""
        averageMileTimeLabel.text = ""
        averageLapTimeNeeded.text = ""
        actualMileTimeLabel.text = ""
        actualMinuteTimeLabel.text = ""
        actualSecondTimeLabel.text = ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let stat = runInfo {
            runInfo?.miles = targetDistanceLabel.text
            runInfo?.targetALT = averageLapTimeNeeded.text
            runInfo?.targetAMT = averageMileTimeLabel.text
            runInfo?.elapsedHours = actualMileTimeLabel.text
            runInfo?.elapsedMinutes = actualMinuteTimeLabel.text
            runInfo?.elapsedSeconds = actualSecondTimeLabel.text
            runInfo?.targetHours = targetTimeLabel.text
            runInfo?.targetMinutes = targetMinuteLabel.text
            runInfo?.targetSeconds = targetSecondLabel.text
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

