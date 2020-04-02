//
//  VisualArtsViewController.swift
//  JobApp
//
//  Created by Naoki on 3/29/20.
//  Copyright © 2020 Naoki. All rights reserved.
//

import UIKit

class VisualArtsViewController: UIViewController {
    
    let courseName = ["Acting", "Art", "Art History", "Film", "Journalism", "Music", "Television", "Theater"]
    
    var count = 8
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        // Do any additional setup after loading the view.
        tableview.reloadData()
    }
}

extension VisualArtsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "VCell", for: indexPath) as! VTableViewCell
        
        cell.VName.text = String(courseName[indexPath.row])
        
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
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = storyboard?.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
//        //        vc.name.text = String(courseName[indexPath.row])
//        
//        print(String(courseName[indexPath.row]))
//        
//        vc.vcName = String(courseName[indexPath.row])
//        
//        
//        self.navigationController?.pushViewController(vc, animated: true)
//        //        performSegue(withIdentifier: "segue", sender: self)
//    }
}
