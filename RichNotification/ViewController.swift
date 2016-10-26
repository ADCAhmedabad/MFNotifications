//
//  ViewController.swift
//  RichNotification
//
//  Created by MobileFirst Applications on 13/10/16.
//  Copyright © 2016 MobileFirst Applications. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class ViewController: UIViewController {
let notificationTitle = "Hello ADC"
let center = UNUserNotificationCenter.current()
let notificationRequestId = "notificationRequestId"
    @IBOutlet weak var tblNotification: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblNotification.tableFooterView = UIView(frame: CGRect.zero)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NotificationType.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: kNotificationCell)!
        let cellTextColor =  (indexPath.row % 2 == 0) ? oddCellTextColor : evenCellTextColor
        cell.textLabel?.textColor = cellTextColor
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.textAlignment = NSTextAlignment.center;
        cell.textLabel?.font =  UIFont.boldSystemFont(ofSize: 21)
        cell.textLabel?.text = getCellText(indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case NotificationType.plain.hashValue:
            sendNormalNotification()
            break
        case NotificationType.richText.hashValue:
            sendRichNotification()
            break
        case NotificationType.action.hashValue:
            sendActionNotification()
            break
        case NotificationType.photoLocal.hashValue:
            sendLocalAttachmentNotification(notificationType: .photoLocal)
            break
        case NotificationType.gifLocal.hashValue:
            sendLocalAttachmentNotification(notificationType: .gifLocal)
            break
        case NotificationType.audioLocal.hashValue:
            sendLocalAttachmentNotification(notificationType: .audioLocal)
            break
        case NotificationType.videoLocal.hashValue:
            sendLocalAttachmentNotification(notificationType: .videoLocal)
            break

        case NotificationType.customContent.hashValue:
            sendCustomeNotification(notificationType: .customContent)
            
        case NotificationType.animatedcustomContent.hashValue:
            sendCustomeNotification(notificationType: .animatedcustomContent)
        default:
            break
        }
    }
    
    
    //MARK: - Helping Methods
    //MARK:
    func getCellText(indexPath:IndexPath) -> String{
        
        switch indexPath.row {
        case NotificationType.plain.hashValue:
            return "Send Normal Notification"
        case NotificationType.action.hashValue:
            return "Send Action Button Notification"
        case NotificationType.richText.hashValue:
            return "Send Rich Text Notification"
        case NotificationType.photoLocal.hashValue:
            return "Send Photo Notification"
//        case NotificationType.photoRemote.hashValue:
//            return "Send Remote Photo Notification"
        case NotificationType.gifLocal.hashValue:
            return "Send Gif Notification"
//        case NotificationType.gifRemote.hashValue:
//            return "Send Remote Gif Notification"
        case NotificationType.audioLocal.hashValue:
            return "Send Audio Notification"
//        case NotificationType.audioRemote.hashValue:
//            return "Send Remote Audio Notification"
        case NotificationType.videoLocal.hashValue:
            return "Send Video Notification"
//        case NotificationType.videoRemote.hashValue:
//            return "Send Remote Video Notification"
        case NotificationType.customContent.hashValue:
            return "Send Custom Content Notification"
        case NotificationType.animatedcustomContent.hashValue:
            return "Send Animated Custom Notification"
        default:
           return""
        }
        
    
    }
    func sendNormalNotification(){
        let content = NotificationContent(title: notificationTitle, subTitle: "Normal Notification", body: "Hey, Thanks for joining us")
        let request = UNNotificationRequest(identifier: NotificationType.plain.rawValue, content: content, trigger: nil)
        UNUserNotificationCenter.current().add(request) { error in
            UNUserNotificationCenter.current().delegate = self
            if (error != nil){
                //handle here
            }
        }
    }
    
    func sendRichNotification(){
        let content = NotificationContent(title: "नमस्ते ADC", subTitle: "रिच अधिसूचना", body: "🍁🍁 सुप्रभात 🍁🍁")
        let request = UNNotificationRequest(identifier: NotificationType.richText.rawValue, content: content, trigger: nil)
        UNUserNotificationCenter.current().add(request) { error in
            UNUserNotificationCenter.current().delegate = self
            if (error != nil){
                //handle here
            }
        }
    }
    
    func sendActionNotification(){
        let content = NotificationContent(title: notificationTitle, subTitle: "Rich Notification", body: "सुप्रभातम् , मनुष्य का बड़ा होना अच्छी बात है., लेकिन उसके व्यक्तित्व में गहराई और विचारों और चारित्र्यमें शुद्धता भी होनी चाहिए तभी वह महान बनता है.")
        content.categoryIdentifier = NotificationType.action.rawValue
        let request = UNNotificationRequest(identifier: NotificationType.action.rawValue, content: content, trigger: nil)
        UNUserNotificationCenter.current().add(request) { error in
            UNUserNotificationCenter.current().delegate = self
            if (error != nil){
                //handle here
            }
        }

    }

    func sendLocalAttachmentNotification(notificationType:NotificationType){
        let content = NotificationContent(title: notificationTitle, subTitle: "Attachment", body: "Media notifications")
        
//        guard let url = Helpers.saveImage(name: "P_pokemon.png") else {
//            return
//        }
        //pokemon.gif
        var url:URL? = URL(string: "")
        switch notificationType {
        case .photoLocal:
            url = Bundle.main.url(forResource: "P_pokemon", withExtension: "png")!
            break
        case .gifLocal:
            url = Bundle.main.url(forResource: "pokemon", withExtension: "gif")!
            break
        case .audioLocal:
            url = Bundle.main.url(forResource: "testing", withExtension: "m4a")!
            break
            
        case .videoLocal:
            url = Bundle.main.url(forResource: "video", withExtension: "mp4")!
            break
            
        default:
            url = Bundle.main.url(forResource: "P_pokemon.png", withExtension: "png")!
            break
            
        }
        guard let attachmentUrl = url else {
            return
        }
        
        let attachment = try? UNNotificationAttachment(identifier: NotificationType.photoLocal.rawValue,
                                                       url: attachmentUrl,
                                                       options: [:])
        if let attachment = attachment {
            content.attachments.append(attachment)
        }
        let request = UNNotificationRequest(identifier: NotificationType.photoLocal.rawValue, content: content, trigger: nil)
        UNUserNotificationCenter.current().add(request) { error in
            UNUserNotificationCenter.current().delegate = self
            if (error != nil){
                
            }
        }

    }
    
    /*func sendRemotPhotoNotification(){
        let content = NotificationContent(title: "SwiftingNotifications", subTitle: "Swifting.io presents", body: "Media notifications")
        
        guard let url = Helpers.saveImage(name: "P_pokemon.png") else {
            return
        }
        let attachment = try? UNNotificationAttachment(identifier: NotificationType.photoRemote.rawValue,
                                                       url: url,
                                                       options: [:])
        if let attachment = attachment {
            content.attachments.append(attachment)
        }
        let request = UNNotificationRequest(identifier: NotificationType.photoRemote.rawValue, content: content, trigger: nil)
        UNUserNotificationCenter.current().add(request) { error in
            UNUserNotificationCenter.current().delegate = self
            if (error != nil){
                
            }
        }
        
    }*/
    
    func sendCustomeNotification(notificationType:NotificationType){
        let Identifier : String =  notificationType.rawValue
       //  let Identifier : String =  "xyz"
        let content = NotificationContent(title: notificationTitle, subTitle: "", body: "Custom notifications")
        
        content.categoryIdentifier = Identifier
        let request = UNNotificationRequest(identifier: Identifier, content: content, trigger: nil)
        UNUserNotificationCenter.current().add(request) { error in
            UNUserNotificationCenter.current().delegate = self
            if (error != nil){
                //handle here
            }
        }
    }
}


extension UIViewController: UNUserNotificationCenterDelegate {
    
    public func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Swift.Void) {
        print("Tapped in notification")
        guard let action = ActionType(rawValue: response.actionIdentifier) else {
            completionHandler()
            return
        }
        
        switch action {
        case .like:
            completionHandler()
            break
           
        case .reply:
            break
            
        }

        
    }
    
    public func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert])
    }
}

