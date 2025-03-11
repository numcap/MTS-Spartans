//
//  AnnouncementDetailVC.swift
//  MTS Spartans
//
//  Created by Jonathan Ishak on 2023-01-08.
//

import UIKit

class AnnouncementDetailVC: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblDescription: UITextView!
    
    var selectedTitle = String()
    var selectedDescription = String()
    var selectedDate = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblTitle.text = selectedTitle
        lblDescription.text = selectedDescription
        lblDate.text = selectedDate
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
