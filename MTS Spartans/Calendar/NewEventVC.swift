//
//  EventEditVC.swift
//  MTS Spartans
//
//  Created by Jonathan Ishak on 2023-01-05.
//

import UIKit

var decorationDates = DateComponents()

class NewEventVC: UIViewController {

    @IBOutlet weak var txtEventName: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
    }
    
    @IBAction func btnSaveData(_ sender: Any) {
        
        if (txtEventName.text == ""){
            let okay = UIAlertAction(title: "Okay", style: .default)
            let alertError = UIAlertController(title: "Error Saving", message: "There Has Been An Error, Please Make Sure All Text Boxes Are Filled", preferredStyle: .alert)
            alertError.addAction(okay)
            self.present(alertError, animated: true)
        }
        else{
            let newEvent = Event()
            newEvent.id = eventsList.count
            newEvent.name = txtEventName.text
            newEvent.date = datePicker.date
            
            eventsList.append(newEvent)
            
            let okay = UIAlertAction(title: "Okay", style: .default)
            let alertNewEvent = UIAlertController(title: "Saved", message: "Your New Calendar Event Has Been Created", preferredStyle: .alert)
            alertNewEvent.addAction(okay)
            self.present(alertNewEvent, animated: true)
            
            let datePickerComponents = Calendar.current.dateComponents(in: .current, from: .now)

            decorationDates = datePickerComponents

            //ViewController().calendarView(ViewController().calendarView, decorationFor: decorationDates)
            
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

