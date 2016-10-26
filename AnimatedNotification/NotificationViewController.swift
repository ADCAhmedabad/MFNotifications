//
//  NotificationViewController.swift
//  AnimatedNotification
//
//  Created by MobileFirst Applications on 15/10/16.
//  Copyright © 2016 MobileFirst Applications. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {
    @IBOutlet var labelHorizontalCenterConstraint: NSLayoutConstraint!

    @IBOutlet var label: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
    }
    
    func didReceive(_ notification: UNNotification) {
        //self.label?.text = notification.request.content.body
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1, animations: {
            self.label?.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
            }, completion: nil)
        
        
    }

}
