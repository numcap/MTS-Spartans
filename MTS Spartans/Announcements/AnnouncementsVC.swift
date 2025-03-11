//
//  AnnouncementsVC.swift
//  MTS Spartans
//
//  Created by Jonathan Ishak on 2023-01-07.
//

import UIKit

class AnnouncementsVC: UITableViewController {
    
    var chosenAnnouncementsTitle = String()
    var chosenAnnouncementsDescription = String()
    var chosenAnnouncementsDate = Date()
    
    let current = Date()
    let formater = DateFormatter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formater.dateFormat = "MMM d, y"
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return announcementsTitle.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "announcementsCell", for: indexPath) as! AnnouncementsCell
        let title = announcementsTitle[indexPath.row]
        let date = announcementsDate[indexPath.row]
        cell.lblTitle.text = title
        cell.lblDate.text = formater.string(from: date)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenAnnouncementsTitle = announcementsTitle[indexPath.row]
        chosenAnnouncementsDescription = announcementsDescription[indexPath.row]
        chosenAnnouncementsDate = announcementsDate[indexPath.row]
        performSegue(withIdentifier: "announcements", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "announcements"{
            let DetailAnnouncementsVC = segue.destination as! AnnouncementDetailVC
            DetailAnnouncementsVC.selectedTitle = chosenAnnouncementsTitle
            DetailAnnouncementsVC.selectedDescription = chosenAnnouncementsDescription
            DetailAnnouncementsVC.selectedDate = formater.string(from: chosenAnnouncementsDate)
        }
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
