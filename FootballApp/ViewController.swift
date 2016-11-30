//
//  ViewController.swift
//  FootballApp
//
//  Created by 20067779 on 28/11/2016.
//  Copyright © 2016 20067779. All rights reserved.
//

import UIKit
//@

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //loadJson (filename: "data.json")
        loadJson()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Fuck this
    
    
    
    func loadJson() {
        if let path = Bundle.main.path(forResource: "data", ofType: "json") {
            do {
                let jsonData = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
                do {
                    let jsonResult: NSDictionary = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                   
                    if let data : [NSDictionary] = jsonResult["data"] as? [NSDictionary] {
                        for data: NSDictionary in data {
                            for (name,value) in data {
                                print("\(name) , \(value)")
                            }
                        }
                    }
                }
                catch {
                print("catch1")
                }
            }
            catch {
            print("catch2")
            }
        }
    }
}
