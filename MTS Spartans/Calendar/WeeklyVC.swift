//
//  CalandarVC.swift
//  MTS Spartans
//
//  Created by Jonathan Ishak on 2023-01-04.
//

import UIKit


class WeeklyVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {
     
    @IBOutlet weak var lblMonth: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    var selectedDate = Date()
    var totalSquares = [Date]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setCellsView()
        setWeekView()

        // Do any additional setup after loading the view.
    }
    
    func setCellsView() {
        let width = (collectionView.frame.size.width - 2) / 8
        let height = (collectionView.frame.size.height - 2)
        
        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.itemSize = CGSize(width: width, height: height)
    }
    
    
    func setWeekView()
        {
            totalSquares.removeAll()
            
            var current = CalendarHelper().sundayForDate(date: selectedDate)
            let nextSunday = CalendarHelper().addDays(date: current, days: 7)
            
            while (current < nextSunday){
                totalSquares.append(current)
                current = CalendarHelper().addDays(date: current, days: 1)
            }
            
            lblMonth.text = CalendarHelper().monthString(date: selectedDate)
                + " " + CalendarHelper().yearString(date: selectedDate)
            collectionView.reloadData()
            tableView.reloadData()
        }
    
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            totalSquares.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "calendarCell", for: indexPath) as! CalendarCell
            
            let date = totalSquares[indexPath.item]
            cell.dayOfMonth.text = String(CalendarHelper().dayOfMonth(date: date))
            
            if(date == selectedDate){
                cell.backgroundColor = #colorLiteral(red: 0.08900000155, green: 0.2700000107, blue: 0.2329999954, alpha: 1)
            }
            else{
                cell.backgroundColor = .systemGroupedBackground
            }
            
            return cell
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedDate = totalSquares[indexPath.item]
        collectionView.reloadData()
        tableView.reloadData()
    }
    
    
    @IBAction func btnNextWeek(_ sender: Any) {
        selectedDate = CalendarHelper().addDays(date: selectedDate, days: 7)
        setWeekView()
    }
    
    
    @IBAction func btnPreviousWeek(_ sender: Any) {
        selectedDate = CalendarHelper().addDays(date: selectedDate, days: -7 )
        setWeekView()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Event().eventsForDate(date: selectedDate).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID") as! EventCell
        let event = Event().eventsForDate(date: selectedDate)[indexPath.row]
        cell.lblEvent.text = event.name + " " + CalendarHelper().timeString(date: event.date)
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
