//
//  ViewControllerTwo.swift
//  FootballApp
//
//  Created by 20067779 on 01/12/2016.
//  Copyright © 2016 20067779. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications
import UserNotificationsUI //framework to customize the notification

class ViewControllerTwo : UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var teamSelection: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var nickname: UILabel!
    @IBOutlet weak var manager: UILabel!
    @IBOutlet weak var stadium: UILabel!
    @IBOutlet weak var league: UILabel!
    
    
    @IBOutlet weak var fixturesTable: UITableView!
    
    
    var currentMatchday = String()
    
    var tableData = [String]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (tableData.count)
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        
        cell.textLabel!.text = tableData[indexPath.row]
        print ("PLEASE")
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.font = UIFont(name:"Helvetica Neue Bold", size:16)
        print (cell.textLabel!.text)
        
        
        return (cell)
    }
    
    
    
    
    override func viewDidLoad() {
        //REQUEST PERMISSION
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: {(granted, error ) in
            if granted {
                print ("Notification access granted")
            } else{
                print (error?.localizedDescription)
                
            }
        })
        fixturesTable.delegate = self
        
        fixturesTable.dataSource = self
        
        
        teamSelection.text = currentMatchday
        getData()
        printDebug()
        
        
        
        
        
        
    }
    
    
    
    
    
    @IBAction func notifyButtonTapped(_ sender: UIButton) {
        scheduleNotification(inSeconds: 5, completion: {success in
            if success{
                print("Successfully scheduled Notification")
            }else{
                print("Error scheduling notification")
            }
        })
        //printDebug()
    }
    
    func scheduleNotification (inSeconds: TimeInterval, completion: @escaping (_ Success: Bool) -> ()){
        let notif = UNMutableNotificationContent()
        notif.title = "Football Facts"
        notif.subtitle = "Here is your fact as requested!"
        notif.body = "The winner of last years title (2015-2016) was Leicester City, managed by Claudio Ranieri with a team that cost only £23 million."
        
        let notifTrigger = UNTimeIntervalNotificationTrigger(timeInterval: inSeconds, repeats: false)
        
        let request = UNNotificationRequest(identifier: "myNotification", content: notif, trigger: notifTrigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
            if error != nil{
                print(error)
                completion(false)
            }else{
                completion(true)
            }
        })
    }
    
    
    func getData(){
        var matchdayGames = [String]()
        
        var currentMatchday = String()
        
        let urlString = "https://raw.githubusercontent.com/opendatajson/football.json/master/2016-17/en.1.json"
        
        
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        
        let session = URLSession.shared
        
      
        
        EZLoadingActivity.show("Loading Fixtures...", disableUI: true)

        
        let task = session.dataTask(with:request, completionHandler: {(data, response, error) in
            if error == nil
            {
                DispatchQueue.main.async
                    {
                        do {
                            
                            print(data!)
                            
                            let parsedData = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String:Any]
                            
                            var matchInfo = " Ooops something went wrong"
                            
                            if let rounds = parsedData["rounds"] as? [AnyObject] // posts started with array
                            {
                                for round in rounds
                                {
                                    let name = round["name"] as! String //specify as String
                                    
                                    if (name == (self.currentMatchday))
                                    {
                                        //print (name)
                                        
                                        
                                        
                                        if let matches = round["matches"] as? [AnyObject]
                                        {
                                            for match in matches
                                            {
                                                let date = match["date"] as! String
                                                
                                                let teams1 = match["team1"] as? NSDictionary
                                                let team1code = teams1?["code"] as? String
                                                
                                                let teams2 = match["team2"] as? NSDictionary
                                                let team2code = teams2?["code"] as? String
                                                
                                                matchInfo = (date + ": " + team1code! + " VS " + team2code!)
                                                print (matchInfo)
                                                matchdayGames.append(matchInfo)
                                                //print ("ADDED")
                                                
                                            }
                                            
                                            
                                            
                                        }
                                        
                                    }
                                }
                                
                                
                                self.getArrayFromClosure(inputArray: matchdayGames)

                            }
                            // Kill the CosyLoadingActivity
                            EZLoadingActivity.hide(true, animated: false)
                            
                        }
                            
                            
                            
                            
                            
                            
                            
                        catch let error as NSError{
                            print(error)
                        }
                        
                }
             
            }
            else{
                // If an error was returned from the async task ....
                DispatchQueue.main.async{
                    
                    EZLoadingActivity.hide(false, animated: false)
                }
            }
            
            
                    })
        
        

        // ends the async task. If any callbacks were needed, they'd execute after this point (I think!)
        print ("RESUMING TASK")
        
        task.resume()
     
    }
    
    func getArrayFromClosure(inputArray:Array<String>){
        for input in inputArray{
            tableData.append(input)
        }
        fixturesTable.reloadData()
        
    }
    
    //USED FOR DEBUGGING ARRAY
    
    func printDebug(){
        for table in tableData{
            print("PRINTING")
            print (table)
        }
        
    }

    
}







