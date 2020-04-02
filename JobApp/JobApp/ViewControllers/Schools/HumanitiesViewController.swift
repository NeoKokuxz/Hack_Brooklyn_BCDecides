//
//  VisualArtsViewController.swift
//  JobApp
//
//  Created by Naoki on 3/29/20.
//  Copyright © 2020 Naoki. All rights reserved.
//

import UIKit

class HumanitiesViewController: UIViewController{
    
    let courseName = ["Communications", "Communication Disorders", "History", "Linguistics", "Philosophy", "Political Science", "Sociology"]
    
    var count = 7
        
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        // Do any additional setup after loading the view.
        tableview.reloadData()
    }
}

extension HumanitiesViewController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HCell", for: indexPath) as! HTableViewCell
        
        cell.HName.text = String(courseName[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        //        vc.name.text = String(courseName[indexPath.row])
        
        print(String(courseName[indexPath.row]))
        
        let text = String(courseName[indexPath.row])
        
        vc.name = text
        
        
        self.navigationController?.pushViewController(vc, animated: true)
        //        performSegue(withIdentifier: "segue", sender: self)
    }
}
