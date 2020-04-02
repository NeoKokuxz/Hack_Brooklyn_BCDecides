//
//  JobListTableViewController.swift
//  JobApp
//
//  Created by Naoki on 3/29/20.
//  Copyright © 2020 Naoki. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    let courseName = ["Business", "Education", "Humanities and Social Sciences", "Natural and Behavioral Sciences", "Visual, Media & Performing Arts"]
    
    var count = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "majorCell", for: indexPath) as! MajorListViewCell
        
        cell.majorLabel.text = String(courseName[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        //        vc.name.text = String(courseName[indexPath.row])
        
        print(String(courseName[indexPath.row]))
        
        vc.vcName = String(courseName[indexPath.row])
        
        
        self.navigationController?.pushViewController(vc, animated: true)
        //        performSegue(withIdentifier: "segue", sender: self)
    }
    
}
