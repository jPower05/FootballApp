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

class ViewControllerTwo : UIViewController{
    
    @IBOutlet weak var teamSelection: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var nickname: UILabel!
    @IBOutlet weak var manager: UILabel!
    @IBOutlet weak var stadium: UILabel!
    @IBOutlet weak var league: UILabel!
    var currentTeam = String()
    
    var capacity = String()
    
    

    
    
    override func viewDidLoad() {
        //REQUEST PERMISSION
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: {(granted, error ) in
            if granted {
                print ("Notification access granted")
            } else{
                print (error?.localizedDescription)
            }
        })
        
        
        teamSelection.text = currentTeam
        getData()
        
        
    }
    
    
    
    
    @IBAction func notifyButtonTapped(_ sender: UIButton) {
        scheduleNotification(inSeconds: 5, completion: {success in
            if success{
                print("Successfully scheduled Notification")
            }else{
                print("Error scheduling notification")
            }
        })
    }

    func scheduleNotification (inSeconds: TimeInterval, completion: @escaping (_ Success: Bool) -> ()){
        let notif = UNMutableNotificationContent()
        notif.title = "Football Facts"
        notif.subtitle = "Here is your fact as requested!"
        notif.body = "This is a body"
        
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
        
        let urlString = "https://raw.githubusercontent.com/opendatajson/football.json/master/2015-16/en.1.json"
        
        
        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        
        var session = URLSession.shared
        
        session.dataTask(with:request, completionHandler: {(data, response, error) in
            if error != nil {
                print(error!)
            } else {
                do {
                    
                    print(data!)
                    
                    let parsedData = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String:Any]
                    
                    print(parsedData)
                    
                    
                } catch let error as NSError {
                    print(error)
                }
                
            }
            
        }).resume()
        
        
    }

}

