//
//  ListStatsTableViewController.swift
//  Hackathon
//
//  Created by Connie Liu on 7/17/18.
//  Copyright © 2018 Tania Ortiz-Rosales. All rights reserved.
//

import UIKit

class ListStatsTableViewController: UITableViewController {
    
//    var stats = [Stat]()  {
//        didSet {
//            tableView.reloadData()
//        }
//    }
    
    var runInfos = [RunInfo]() {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
            runInfos = CoreDataHelper.retrieveRunInfos()
            print(runInfos.count)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
//        return stats.count
        return runInfos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listStatsTableViewCell", for: indexPath) as! ListStatsTableViewCell
//        let run = stats[indexPath.row]
//      cell.statDateLabel.text = stat.modificationTime?.convertToString() ?? ""
//        print("Just checking the array's count: \(runInfos.count)")
//
        let runInfo = runInfos[indexPath.row]
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateStyle = .full
//
//
//        print(runInfo.modificationTime)
//        let dateString = dateFormatter.string(from: runInfo.modificationTime!)
        
        
//        cell.statDateLabel.text = dateString
        
        cell.statDateLabel.text = runInfo.modificationTime?.convertToString() ?? ""
        
        return cell
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let runInfo = runInfos[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let displayAllInfoViewController = storyboard.instantiateViewController(withIdentifier: "DisplayAllInfoViewController") as! DisplayAllInfoViewController
        displayAllInfoViewController.runInfo = runInfo
        
        navigationController?.pushViewController(displayAllInfoViewController, animated: true)
//        self.performSegue(withIdentifier: "displayStat", sender: self)
//        let stat = self.stats[indexPath.row]
//        self.performSegue(withIdentifier: "displayStat", sender: stat)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // check the right identifier/ segue
        if segue.identifier == "displayRaceInfo"{
            // calling the displayNoteVC
            let DisplayAllInfoViewController = segue.destination as! DisplayAllInfoViewController
            // cast sender(Any) to Note
            let runInfo = sender as? RunInfo
            // pass the value of note to note of Dsiplay Note VC
            DisplayAllInfoViewController.runInfo = runInfo
        }
    }

}
