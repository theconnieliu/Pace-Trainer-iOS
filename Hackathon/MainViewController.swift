//
//  MainViewController.swift
//  Hackathon
//
//  Created by Tania Ortiz-Rosales on 7/16/18.
//  Copyright © 2018 Tania Ortiz-Rosales. All rights reserved.
//

import UIKit
import Foundation

class MainViewController: UIViewController {
    
    var hour : Int = 0
    var minutes : Int = 0
    var seconds : Int = 0

    @IBOutlet weak var targetTimePicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePace()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation
 
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
//  THE FOLLOWING FUNCTION CALCULATES PACE PER MILE WITH DISTANCE AND TIME VARIABLES. IT HAS NOT YET BEEN HOOKED UP TO THE UI
    func calculatePace(){
        
        let hours:Double = 0
        let minutes:Double = 16
        let seconds:Double = 45
        let distance:Double = 3.1
        
//      The code below is the actual math stuff (turn everything to just seconds)
        let unParsedTime:Double = (((seconds) + (hours*60*60) + (minutes*60))/(distance))/60
        
        
//      The code below is separating the returned minutes and parses everything
        let parsedTime:[String] = String(unParsedTime).components(separatedBy: ".")
        let finalMinutes = parsedTime[0]
        let fractionSeconds: String = ((".")+parsedTime[1])
        let doubleSeconds: Double = Double(fractionSeconds)!
        let finalSeconds: Double = doubleSeconds * 60
        let formatedFinalSeconds: String = String(format: "%.2f", finalSeconds)
        print("\(finalMinutes):\(formatedFinalSeconds)/mile")
    }
    
}



// THE FOLLOWING CODE IS MEANT TO CREATE THREE SLIDERS IN THE PICKER VIEW
// HOURS, MINUTES, AND SECONDS

extension MainViewController:UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 25
        case 1,2:
            return 60

        default:
            return 0
        }
    }

    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return pickerView.frame.size.width/3
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return "\(row) Hour"
        case 1:
            return "\(row) Minute"
        case 2:
            return "\(row) Second"
        default:
            return ""
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            hour = row
        case 1:
            minutes = row
        case 2:
            seconds = row
        default:
            break;
        }
    }
}
