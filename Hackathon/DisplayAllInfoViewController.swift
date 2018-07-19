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
    @IBOutlet weak var averageMileTimeLabel: UILabel!
    @IBOutlet weak var averageLapTimeNeeded: UILabel!
    @IBOutlet weak var actualMileTimeLabel: UILabel!
    
    var stat: Stat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        targetDistanceLabel.text = ""
        targetTimeLabel.text = ""
        averageMileTimeLabel.text = ""
        averageLapTimeNeeded.text = ""
        actualMileTimeLabel.text = ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let stat = stat {
            targetDistanceLabel.text = stat.targetDistance
            targetTimeLabel.text = stat.targetTime
            averageMileTimeLabel.text = stat.averageMileTime
            averageLapTimeNeeded.text = stat.averageLapTime
            actualMileTimeLabel.text = stat.actualMileTime
        } else {
            targetDistanceLabel.text = ""
            targetTimeLabel.text = ""
            averageMileTimeLabel.text = ""
            averageLapTimeNeeded.text = ""
            actualMileTimeLabel.text = ""
        }//if else
    }//view will appear
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case "saveStat" where stat != nil:
            stat?.targetDistance = targetDistanceLabel.text ?? ""
            stat?.targetTime = targetTimeLabel.text ?? ""
            stat?.averageMileTime = averageMileTimeLabel.text ?? ""
            stat?.averageLapTime = averageLapTimeNeeded.text ?? ""
            stat?.actualMileTime = actualMileTimeLabel.text ?? ""
            stat?.modificationTime = Date()
            CoreDataHelper.saveStat()
            
        case "saveStat" where stat == nil:
            let stat = CoreDataHelper.newStat()
            stat.targetDistance = targetDistanceLabel.text ?? ""
            stat.targetTime = targetTimeLabel.text ?? ""
            stat.averageMileTime = averageMileTimeLabel.text ?? ""
            stat.averageLapTime = averageLapTimeNeeded.text ?? ""
            stat.actualMileTime = actualMileTimeLabel.text ?? ""
            stat.modificationTime = Date()
            CoreDataHelper.saveStat()
            
        default:
            print("unexpected segue identifier")
        }
    }

}

