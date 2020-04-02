//
//  VisualArtsViewController.swift
//  JobApp
//
//  Created by Naoki on 3/29/20.
//  Copyright © 2020 Naoki. All rights reserved.
//

import UIKit

class BusinessViewController: UIViewController{
    
    let courseName = ["Accounting", "Business", "Economics", "Finance", "Human Resources", "Marketing", "Real Estate"]
    
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

extension BusinessViewController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BCell", for: indexPath) as! BTableViewCell
        
        cell.BName.text = String(courseName[indexPath.row])
        
        print(cell.bname)
        
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
