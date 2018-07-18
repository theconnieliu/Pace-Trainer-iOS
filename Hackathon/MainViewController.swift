//
//  MainViewController.swift
//  Hackathon
//
//  Created by Tania Ortiz-Rosales on 7/16/18.
//  Copyright © 2018 Tania Ortiz-Rosales. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func calculatePace() {
        
    }
    

}
