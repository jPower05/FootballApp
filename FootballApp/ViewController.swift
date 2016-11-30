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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Fuck this
    
    func translate(_ sender: AnyObject) {
        //var stringUrl = "https://sportsop-soccer-sports-open-data-v1.p.mashape.com/v1/leagues/{league_slug}/seasons/{season_slug}/standings"
        //stringUrl = stringUrl.stringByReplacingOccurrencesOfString(" ", withString: "+")
        let urlStr:String = ("https://sportsop-soccer-sports-open-data-v1.p.mashape.com/v1/leagues/{league_slug}/seasons/{season_slug}/standings")
        let url = URL(string: urlStr)
        let session = URLSession.shared
        let mutableRequest = NSMutableURLRequest(url: url! as URL)
        mutableRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        mutableRequest.setValue("s1nDqzQHqmmshHlVWz1I1mBq6KrMp1tF7IfjsnnEi5X3AaUEwu", forHTTPHeaderField: "X-Mashape-Key")
        
        var result = "<Translation Error>"
        
        session.dataTask(with: url!){
            (data, response, error) in
            
        if let httpResponse = response as? HTTPURLResponse {
            if(httpResponse.statusCode == 200){
                
                let jsonDict: NSDictionary = try! JSONSerialization.jsonObject(with: data!, options: []) as! NSDictionary
                let dataDictionary = jsonDict["data"] as! NSDictionary
                let standingsArray = dataDictionary["standings"] as! [String:Any]
                for standings in standingsArray{
                    //let position = standings["position"]! as! [String:Any]
                    //let
                }
                
            }
            }
            
            DispatchQueue.main.async {
                
            }
        }.resume()
    }
        

    
    
}
