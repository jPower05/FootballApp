//
//  ViewController.swift
//  FootballApp
//
//  Created by 20067779 on 28/11/2016.
//  Copyright © 2016 20067779. All rights reserved.
//

import UIKit
//@

class ViewController: UIViewController, UITextViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var teamPicker: UIPickerView!
    
    @IBOutlet weak var hiddenLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.teamPicker.delegate = self
        self.teamPicker.dataSource = self
        hiddenLabel.isHidden = true
        hiddenLabel.text = "Matchday 14"
        // Do any additional setup after loading the view, typically from a nib.
        //loadJson (filename: "data.json")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    var matchday = ["Matchday 1", "Matchday 2", "Matchday 3", "Matchday 4", "Matchday 5", "Matchday 6", "Matchday 7", "Matchday 8", "Matchday 9", "Matchday 10", "Matchday 11", "Matchday 12", "Matchday 13", "Matchday 14", "Matchday 15", "Matchday 16", "Matchday 17", "Matchday 18", "Matchday 19", "Matchday 20", "Matchday 21", "Matchday 22", "Matchday 23", "Matchday 24", "Matchday 25", "Matchday 26", "Matchday 27", "Matchday 28", "Matchday 29", "Matchday 30", "Matchday 31", "Matchday 32", "Matchday 33","Matchday 33", "Matchday 34", "Matchday 35", "Matchday 36", "Matchday 37", "Matchday 38"]
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return matchday.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return matchday[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        hiddenLabel.text = matchday[row]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let DestViewController : ViewControllerTwo = segue.destination as! ViewControllerTwo
        
        DestViewController.currentMatchday = hiddenLabel.text!
    }
    
}
