//
//  MajorListViewController.swift
//  JobApp
//
//  Created by Naoki on 3/29/20.
//  Copyright © 2020 Naoki. All rights reserved.
//

import UIKit

class MajorListViewController: UITableViewController {
    
    let courseName = ["Accounting", "Computer Science", "Health", "Music", "Art"]
    
    var count = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.tableView.reloadData()
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stockCell", for: indexPath) as! MajorListViewCell
        
        cell.majorLabel.text = String(courseName[indexPath.row])
        
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = storyboard?.instantiateViewController(identifier: "JobListViewController") as! JobListViewController
//        vc.jobLabel.text = String(courseName[indexPath.row])
//
//
//        self.navigationController?.pushViewController(vc, animated: true)
//        //        performSegue(withIdentifier: "segue", sender: self)
//    }
    
}

//extension MajorListViewController: UITableViewDelegate {
//
//}
