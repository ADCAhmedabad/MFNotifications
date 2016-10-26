//
//  NotificationViewController.swift
//  TestingNotifications
//
//  Created by Varad Pathak on 15/10/16.
//  Copyright © 2016 MobileFirst Applications. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet var label: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any required interface initialization here.
    }
    
    @IBAction func btnClicked(_ sender: AnyObject) {
    }
    
    func didReceive(_ notification: UNNotification) {
        self.label?.text = notification.request.content.body
    }

}
