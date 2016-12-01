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
        
        
    }
    
    var currentTeam = String()
    var stadium = "stadium"
    var nickname = "nickname"
    var location = "location"
    var manager = "manager"
    var league = "league"
    var capacity = "capacity"
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let DestViewController : ViewController = segue.destination as! ViewController
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
        notif.title = "New Notification"
        notif.subtitle = "Subtitle"
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
    
    
}

    
