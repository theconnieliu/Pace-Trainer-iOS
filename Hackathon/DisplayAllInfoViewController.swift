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

//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        if let stat = stat {
//            targetDistanceLabel.text = stat.target
//            targetTimeLabel.text = stat.
//            averageMileTimeLabel.text = stat.
//            averageLapTimeNeeded.text = stat.
//            actualMileTimeLabel.text = stat.
//        } else {
//            titleTextField.text = ""
//            contentTextView.text = ""
//        }//if else
//    }//view will appear
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
