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
        hiddenLabel.text = "Bournemouth"
        // Do any additional setup after loading the view, typically from a nib.
        //loadJson (filename: "data.json")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    var teams = ["Bournemouth", "Arsenal", "Burnley", "Chelsea", "Crystal Palace", "Everton", "Hull City", "Leicester City", "Liverpool", "Manchester City", "Manchester United", "Middlesbrough", "Southampton", "Stoke City", "Sunderland", "Swansea City", "Tottenham Hotspur", "Watford", "West Brom", "West Ham"]
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return teams.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return teams[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        hiddenLabel.text = teams[row]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let DestViewController : ViewControllerTwo = segue.destination as! ViewControllerTwo
        
        DestViewController.currentTeam = hiddenLabel.text!
    }
    
}
