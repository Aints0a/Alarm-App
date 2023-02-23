//
//  SaveViewController.swift
//  Alarm App
//
//  Created by Jean Yves Kaliva on 2/23/23.
//

import UIKit

class SaveViewController: UIViewController {

    @IBOutlet weak var timeTextField: UITextField!
    var timeCollection = [AlarmModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let time = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        timeTextField.text = formatter.string(from: time)
        timeTextField.textColor = .blue
        
        let timePicker = UIDatePicker()
        timePicker.datePickerMode = .time
        timePicker.addTarget(self, action: #selector(timePickerValueChange(sender:)), for: UIControl.Event.valueChanged)
        timePicker.frame.size = CGSize(width: 0, height: 250)
        timeTextField.inputView = timePicker
    }
    
    //MARK: - When user change time
   
    @objc func timePickerValueChange(sender: UIDatePicker)
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        timeTextField.text = formatter.string(from: sender.date)
    }
    

    @IBAction func saveButton(_ sender: UIBarButtonItem) {
       let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        if let time = formatter.date(from: timeTextField.text ?? ""){
            let timeSaved = AlarmModel(times: time)
            timeCollection.append(timeSaved)
        }
        
    }
}

