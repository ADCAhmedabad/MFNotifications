//
//  NotificationViewController.swift
//  RichNotifications
//
//  Created by Rahul Chandnani on 15/10/16.
//  Copyright © 2016 MobileFirst Applications. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    //@IBOutlet var label: UILabel?
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let filePath = Bundle.main.path(forResource: "pokemon", ofType: "gif")
//        let gif = NSData(contentsOfFile: filePath!)!
//        webView.load(gif as Data, mimeType: "image/gif", textEncodingName: String(), baseURL: URL(string: filePath!)!)
//        webView.isUserInteractionEnabled = false;
        
        let url = NSURL (string: "https://www.google.co.in/");
        let requestObj = NSURLRequest(url: url! as URL);
        webView.loadRequest(requestObj as URLRequest);
    }
    
    func didReceive(_ notification: UNNotification) {
        //self.label?.text = notification.request.content.body
    }

}
