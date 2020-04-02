//
//  DetailViewController.swift
//  JobApp
//
//  Created by Naoki on 3/29/20.
//  Copyright © 2020 Naoki. All rights reserved.
//

import UIKit
import Charts

class DetailViewController: UIViewController, ChartViewDelegate {
    
    @IBOutlet weak var majorName: UILabel!
    
    @IBOutlet weak var jobTable: UITableView!
    
    @IBOutlet weak var PLanguageChart: PieChartView!
    
    @IBOutlet weak var TopTechChart: PieChartView!
    
    @IBOutlet weak var Top10Skills: UILabel!
    
    @IBOutlet weak var TopSoftChart: PieChartView!
    
    let PLanguage = ["Java", "Python", "Swift", "C/C++", "C#", "JavaScript", "PHP", "R"]
    
    let FSkills = ["Interpersonal","Formal talk","Financial reporting", "Ability to communicate", "Problem-solving skills", "Analytical ability", "IT software", "Management", "Commercial acumen", "Capacity for innovation"]
    let PPercent = [18.0, 34.0, 2.0, 6.0, 7.0, 9.0, 6.0, 4.0]
    
    let TechSkills = ["JS", "Troubleshooting", "SQL", "Database", "Scala", "Linux", "Excel", "Machine Learning", "AWS", "Webscrape"]
    let TPercent = [16.0,6.0,6.0,8.0,6.0, 8.0,10.0,12.0, 12.0, 8.0]
    
    let SoftSkills = ["Communication", "Verbal", "Analytical", "Written", "Team", "Decision Making", "Interpersonal", "Problem Solving", "Self Motivated", "Time Management"]
    let SPercent = [22.0, 16.0, 14.0, 11.0, 11.0, 5.0, 5.0, 5.0, 5.0, 5.0]
    
    var name = ""
    
    let jobListA = ["Accounting Professor", "Finance Inverstor", "Corporate Controller", "Finance Coordinator", " Investment Banker", "Quantitative Researcher", "Finance Analyst", "Risk Management/Risk Control", "Financial Officer", "Investment Analyst"]
    
    let jobList = ["Software Developer", "Database Administrator", "Computer Hardware Engineer", "Computer Systems Analyst", "Computer Network Architect", "Web Developer", "Information Security Analyst", "Computer and Information Research Scientists", "Information Security Analyst", "IT Project Manager"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jobTable.delegate = self
        jobTable.dataSource = self
        majorName.text = name
        
        PLanguageChart.delegate = self
        let l = PLanguageChart.legend
        l.horizontalAlignment = .right
        l.verticalAlignment = .top
        l.orientation = .vertical
        l.xEntrySpace = 7
        l.yEntrySpace = 0
        l.yOffset = 0
        
        PLanguageChart.entryLabelColor = .black
        PLanguageChart.entryLabelFont = .systemFont(ofSize: 12, weight: .light)
        
        PLanguageChart.animate(xAxisDuration: 1.4, easingOption: .easeOutBack)
        
        TopTechChart.delegate = self
        let x = TopTechChart.legend
        x.horizontalAlignment = .right
        x.verticalAlignment = .top
        x.orientation = .vertical
        x.xEntrySpace = 7
        x.yEntrySpace = 0
        x.yOffset = 0
        
        TopTechChart.entryLabelColor = .black
        TopTechChart.entryLabelFont = .systemFont(ofSize: 12, weight: .light)
        
        TopSoftChart.delegate = self
        let y = TopSoftChart.legend
        y.horizontalAlignment = .right
        y.verticalAlignment = .top
        y.orientation = .vertical
        y.xEntrySpace = 7
        y.yEntrySpace = 0
        y.yOffset = 0
        
        TopSoftChart.entryLabelColor = .black
        TopSoftChart.entryLabelFont = .systemFont(ofSize: 12, weight: .light)
        
//        buildPLChart(dataPoints: PLanguage, value: PPercent)
        updateChartData()
        jobTable.reloadData()

    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @IBAction func backBtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "BusinessVC") as! BusinessViewController
        //        vc.name.text = String(courseName[indexPath.row])
        presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)

        self.navigationController?.pushViewController(vc, animated: true)
        //        performSegue(withIdentifier: "segue", sender: self)
    }
    
//    func buildPLChart(dataPoints: [String], value: [Double]){
////        var dataEntries: [ChartDataEntry] = []
////        for i in 0 ..< dataEntries.count {
////            let dataEntry = ChartDataEntry(x: value[i],y: Double(i))
////            dataEntries.append(dataEntry)
////        }
////
////        let pieChartDataSet = PieChartDataSet(entries: dataEntries, label: "%")
////        let pieChartData = PieChartData(entries: dataPoints, dataSet: pieChartDataSet)
////
//        let entries = (0..< dataPoints.count) { (i) -> PieChartDataEntry in
//            // IMPORTANT: In a PieChart, no values (Entry) should have the same xIndex (even if from different DataSets), since no values can be drawn above each other.
//            return PieChartDataEntry(value: Double(arc4random_uniform(range) + range / 5),
//                                     label: parties[i % parties.count],
//                                     icon: #imageLiteral(resourceName: "icon"))
//        }
//    }
    
    func FDataCount(_ count: Int, perfecent: [Double]) {
        let entries = (0..<count).map { (i) -> PieChartDataEntry in
            // IMPORTANT: In a PieChart, no values (Entry) should have the same xIndex (even if from different DataSets), since no values can be drawn above each other.
            return PieChartDataEntry(value: Double(perfecent[i]),
                                     label: FSkills[i],
                                     icon: nil)
        }
        
        let set = PieChartDataSet(entries: entries, label: "Results")
        set.drawIconsEnabled = false
        set.sliceSpace = 2
        
        
        set.colors = ChartColorTemplates.vordiplom()
            + ChartColorTemplates.joyful()
            + ChartColorTemplates.colorful()
            + ChartColorTemplates.liberty()
            + ChartColorTemplates.pastel()
            + [UIColor(red: 51/255, green: 181/255, blue: 229/255, alpha: 1)]
        
        let data = PieChartData(dataSet: set)
        
        let pFormatter = NumberFormatter()
        pFormatter.numberStyle = .percent
        pFormatter.maximumFractionDigits = 1
        pFormatter.multiplier = 1
        pFormatter.percentSymbol = " %"
        data.setValueFormatter(DefaultValueFormatter(formatter: pFormatter))
        
        data.setValueFont(.systemFont(ofSize: 11, weight: .light))
        data.setValueTextColor(.black)
        
        PLanguageChart.data = data
        PLanguageChart.highlightValues(nil)
    }
    func PDataCount(_ count: Int, perfecent: [Double]) {
        let entries = (0..<count).map { (i) -> PieChartDataEntry in
            // IMPORTANT: In a PieChart, no values (Entry) should have the same xIndex (even if from different DataSets), since no values can be drawn above each other.
            return PieChartDataEntry(value: Double(perfecent[i]),
                                     label: PLanguage[i],
                                     icon: nil)
        }
        
        let set = PieChartDataSet(entries: entries, label: "Results")
        set.drawIconsEnabled = false
        set.sliceSpace = 2
        
        
        set.colors = ChartColorTemplates.vordiplom()
            + ChartColorTemplates.joyful()
            + ChartColorTemplates.colorful()
            + ChartColorTemplates.liberty()
            + ChartColorTemplates.pastel()
            + [UIColor(red: 51/255, green: 181/255, blue: 229/255, alpha: 1)]
        
        let data = PieChartData(dataSet: set)
        
        let pFormatter = NumberFormatter()
        pFormatter.numberStyle = .percent
        pFormatter.maximumFractionDigits = 1
        pFormatter.multiplier = 1
        pFormatter.percentSymbol = " %"
        data.setValueFormatter(DefaultValueFormatter(formatter: pFormatter))
        
        data.setValueFont(.systemFont(ofSize: 11, weight: .light))
        data.setValueTextColor(.black)
        
        PLanguageChart.data = data
        PLanguageChart.highlightValues(nil)
    }
    
    func TDataCount(_ count: Int, perfecent: [Double]) {
        let entries = (0..<count).map { (i) -> PieChartDataEntry in
            // IMPORTANT: In a PieChart, no values (Entry) should have the same xIndex (even if from different DataSets), since no values can be drawn above each other.
            return PieChartDataEntry(value: Double(perfecent[i]),
                                     label: TechSkills[i],
                                     icon: nil)
        }
        
        let set = PieChartDataSet(entries: entries, label: "Results")
        set.drawIconsEnabled = false
        set.sliceSpace = 2
        
        
        set.colors = ChartColorTemplates.vordiplom()
            + ChartColorTemplates.joyful()
            + ChartColorTemplates.colorful()
            + ChartColorTemplates.liberty()
            + ChartColorTemplates.pastel()
            + [UIColor(red: 51/255, green: 181/255, blue: 229/255, alpha: 1)]
        
        let data = PieChartData(dataSet: set)
        
        let pFormatter = NumberFormatter()
        pFormatter.numberStyle = .percent
        pFormatter.maximumFractionDigits = 1
        pFormatter.multiplier = 1
        pFormatter.percentSymbol = " %"
        data.setValueFormatter(DefaultValueFormatter(formatter: pFormatter))
        
        data.setValueFont(.systemFont(ofSize: 11, weight: .light))
        data.setValueTextColor(.black)
        
        TopTechChart.data = data
        TopTechChart.highlightValues(nil)
    }
    
    func SDataCount(_ count: Int, perfecent: [Double]) {
        let entries = (0..<count).map { (i) -> PieChartDataEntry in
            // IMPORTANT: In a PieChart, no values (Entry) should have the same xIndex (even if from different DataSets), since no values can be drawn above each other.
            return PieChartDataEntry(value: Double(perfecent[i]),
                                     label: SoftSkills[i],
                                     icon: nil)
        }
        
        let set = PieChartDataSet(entries: entries, label: "Results")
        set.drawIconsEnabled = false
        set.sliceSpace = 2
        
        
        set.colors = ChartColorTemplates.vordiplom()
            + ChartColorTemplates.joyful()
            + ChartColorTemplates.colorful()
            + ChartColorTemplates.liberty()
            + ChartColorTemplates.pastel()
            + [UIColor(red: 51/255, green: 181/255, blue: 229/255, alpha: 1)]
        
        let data = PieChartData(dataSet: set)
        
        let pFormatter = NumberFormatter()
        pFormatter.numberStyle = .percent
        pFormatter.maximumFractionDigits = 1
        pFormatter.multiplier = 1
        pFormatter.percentSymbol = " %"
        data.setValueFormatter(DefaultValueFormatter(formatter: pFormatter))
        
        data.setValueFont(.systemFont(ofSize: 11, weight: .light))
        data.setValueTextColor(.black)
        
        TopSoftChart.data = data
        TopSoftChart.highlightValues(nil)
    }
    
    func updateChartData() {
//        if self.shouldHideData {
//            PLanguageChart.data = nil
//            return
//        }
        
        self.PDataCount(Int(8), perfecent: PPercent)
        self.TDataCount(Int(10), perfecent: TPercent)
        self.SDataCount(Int(8), perfecent: SPercent)
        
        let text = majorName.text!
        if(text == "Finance"){
            self.FDataCount(Int(10), perfecent: SPercent)
        }
    }
}

//MARK: - TableView

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "jobCell", for: indexPath) as! JobTableViewCell
        
        let text =  String(majorName.text!)
        if(text == "Finance" ){
            Top10Skills.text = "Top 10 Finance Skills"
            Top10Skills.textAlignment = .center
            Top10Skills.font = UIFont.italicSystemFont(ofSize: 17)
            cell.jobLabel.text = String(jobListA[indexPath.row])
        } else {
            cell.jobLabel.text = String(jobList[indexPath.row])
        }
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = storyboard?.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
//        //        vc.name.text = String(courseName[indexPath.row])
//
//        print(String(jobList[indexPath.row]))
//
//        let text = String(jobList[indexPath.row])
//
//        vc.name = text
    
}
