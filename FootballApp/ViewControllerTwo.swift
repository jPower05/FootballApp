//
//  ViewControllerTwo.swift
//  FootballApp
//
//  Created by 20067779 on 01/12/2016.
//  Copyright © 2016 20067779. All rights reserved.
//

import Foundation
import UIKit

class ViewControllerTwo : UIViewController{
    
    @IBOutlet weak var teamSelection: UILabel!
    
    @IBAction func backButton(_ sender: AnyObject) {
    }
    override func viewDidLoad() {
        teamSelection.text = currentTeam
    }
    
    var currentTeam = String()
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let DestViewController : ViewController = segue.destination as! ViewController
    }


}
