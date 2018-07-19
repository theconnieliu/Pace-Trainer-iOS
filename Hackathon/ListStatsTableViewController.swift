//
//  ListStatsTableViewController.swift
//  Hackathon
//
//  Created by Connie Liu on 7/17/18.
//  Copyright © 2018 Tania Ortiz-Rosales. All rights reserved.
//

import UIKit

class ListStatsTableViewController: UITableViewController {
    
    var stats = [Stat]()  {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
            stats = CoreDataHelper.retrieveStats()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return stats.count

    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listStatsTableViewCell", for: indexPath) as! ListStatsTableViewCell
        let stat = stats[indexPath.row]
        cell.statDateLabel.text = stat.modificationTime?.convertToString() ?? ""
        return cell
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let stat = self.stats[indexPath.row]
        self.performSegue(withIdentifier: "displayStat", sender: stat)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // check the right identifier/ segue
        if segue.identifier == "displayStat"{
            // calling the displayNoteVC
            let DisplayAllInfoViewController = segue.destination as! DisplayAllInfoViewController
            // cast sender(Any) to Note
            let runInfo = sender as? RunInfo
            // pass the value of note to note of Dsiplay Note VC
            DisplayAllInfoViewController.runInfo = runInfo
        }
    }

}
