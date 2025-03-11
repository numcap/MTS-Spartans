//
//  ViewController.swift
//  MTS Spartans
//
//  Created by Jonathan Ishak on 2022-12-30.
//

import UIKit



class ViewController: UIViewController, UICalendarViewDelegate, UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet weak var AnnouncementsTableView: UITableView!
    
    let calendarView = UICalendarView()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        AnnouncementsTableView.reloadData()
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        announcementsDate.insert(CalendarHelper().addDays(date: .now, days: -3), at: 0)
        
        calendarView.calendar = .current
        calendarView.locale = .current
        calendarView.fontDesign = .rounded
        calendarView.delegate = self
        calendarView.layer.cornerRadius = 22
        
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        
        var dateComps = Calendar.current.dateComponents(in: .current, from: .now)
        
        view.addSubview(calendarView)
        
        NSLayoutConstraint.activate([
            calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            calendarView.topAnchor.constraint(equalTo: AnnouncementsTableView.bottomAnchor, constant: 60)
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return announcementsTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeAnouncements", for: indexPath) as! HomeAnnouncementsCell
        let title = announcementsTitle[indexPath.row]
        cell.lblTitleHome.text = title
        return cell
    }
    

        func calendarView (_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
            
            if dateComponents.isValidDate{
                return UICalendarView.Decoration.default(color: #colorLiteral(red: 0.08900000155, green: 0.2700000107, blue: 0.2329999954, alpha: 1), size: .medium)
                
            }else{
                return nil
            }
        }
}



extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
