//
//  NewAnnouncementsVC.swift
//  MTS Spartans
//
//  Created by Jonathan Ishak on 2023-01-06.
//

import UIKit

class NewAnnouncementsVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtDescription: UITextView!
    
    var currentDate = Date()
    
    @IBAction func btnSave(_ sender: Any) {
        
        if (txtTitle.text == "" || txtDescription.text == ""){
            let okay = UIAlertAction(title: "Okay", style: .default)
            let alertError = UIAlertController(title: "Error Saving", message: "There Has Been An Error, Please Make Sure All Text Boxes Are Filled", preferredStyle: .alert)
            alertError.addAction(okay)
            self.present(alertError, animated: true)
        }
        else{
            announcementsTitle.insert(txtTitle.text!, at: 0)
            announcementsDescription.insert(txtDescription.text!, at: 0)
            announcementsDate.insert(currentDate, at: 0)
            
            AnnouncementsVC().tableView.reloadData()
            
            let okay = UIAlertAction(title: "Okay", style: .default)
            let alertNewAnnouncements = UIAlertController(title: "Saved", message: "Your New Announcement Has Been Created", preferredStyle: .alert)
            alertNewAnnouncements.addAction(okay)
            self.present(alertNewAnnouncements, animated: true)
        }
        
        
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        txtTitle.delegate = self
        
        let borderColor : UIColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        txtDescription.layer.borderWidth = 0.5
        txtDescription.layer.borderColor = borderColor.cgColor
        txtDescription.layer.cornerRadius = 5.0
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = txtTitle.text ?? ""
        guard let stringRange = Range(range, in: currentText) else {return false}
        let updateText = currentText.replacingCharacters (in: stringRange, with: string)
        return updateText.count < 35
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
