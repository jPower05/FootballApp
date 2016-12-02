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
        factSetup()
        
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

    func factSetup(){
        if ((currentTeam) == "Bournemouth"){
            stadium.text = "    Stadium: Dean Court"
            nickname.text = "    Nickname: The Cherries"
            location.text = "    Location: Bournemouth, Dorset"
            manager.text = "    Manager: Eddie Howe"
            league.text = "    League: Premier League"
            capacity = "11,464"
        }
        if ((currentTeam) == "Arsenal"){
            stadium.text = "    Stadium: Emirates Stadium"
            nickname.text = "    Nickname: The Gunners"
            location.text = "    Location: Highbury, London"
            manager.text = "    Manager: Arsene Wenger"
            league.text = "    League: Premier League"
            capacity = "60,432"
        }
        if ((currentTeam) == "Burnley"){
            stadium.text = "    Stadium: Turf Moor"
            nickname.text = "    Nickname: The Clarets"
            location.text = "    Location: Burnley, Lancashire"
            manager.text = "    Manager: Sean Dyche"
            league.text = "    League: Premier League"
            capacity = "21,401"
        }
        if ((currentTeam) == "Chelsea"){
            stadium.text = "    Stadium:  Stamford Bridge"
            nickname.text = "    Nickname: The Blues"
            location.text = "    Location: Fulham, London"
            manager.text = "    Manager: Antonio Conte"
            league.text = "    League: Premier League"
            capacity = "41,631"
        }
        if ((currentTeam) == "Crystal Palace"){
            stadium.text = "    Stadium: Selhurst Park"
            nickname.text = "    Nickname: The Eagles"
            location.text = "    Location: South Norwood, London"
            manager.text = "    Manager: Alan Pardew"
            league.text = "    League: Premier League"
            capacity = "25,456"
        }
        if ((currentTeam) == "Everton"){
            stadium.text = "    Stadium: Goodison Park"
            nickname.text = "    Nickname: The Toffees"
            location.text = "    Location: Liverpool"
            manager.text = "    Manager: Ronald Koeman"
            league.text = "    League: Premier League"
            capacity = "39,572"
        }
        if ((currentTeam) == "Hull City"){
            stadium.text = "    Stadium: KCOM Stadium"
            nickname.text = "    Nickname: The Tigers"
            location.text = "    Location: Hull,Yorkshire"
            manager.text = "    Manager: Mike Phelan"
            league.text = "    League: Premier League"
            capacity = "25,450"
        }
        if ((currentTeam) == "Leicester City"){
            stadium.text = "    Stadium: King Power Stadium"
            nickname.text = "    Nickname: The Foxes"
            location.text = "    Location: Leicester"
            manager.text = "    Manager: Claudio Ranieri"
            league.text = "    League: Premier League"
            capacity = "32,312"
        }
    }
}

