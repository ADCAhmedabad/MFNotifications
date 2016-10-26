//
//  General .swift
//  RichNotification
//
//  Created by MobileFirst Applications on 13/10/16.
//  Copyright © 2016 MobileFirst Applications. All rights reserved.
//

import Foundation
import UIKit
let kNotificationCell = "notification"
let oddCellTextColor = UIColor(red:0.00, green:0.84, blue:0.97, alpha:1.0)
let evenCellTextColor = UIColor(red:0.97, green:0.67, blue:0.19, alpha:1.0)


enum NotificationType: String {
    
    case plain                  =   "notificationPlainId"
    case richText               =   "notificationRichTextId"
    case action                 =   "notificationActionId"
    case photoLocal             =   "notificationPhotoLocalId"
    //case photoRemote             =   "notificationPhotoRemoteId"
    case gifLocal               =   "notificationGifLocalId"
    //case gifRemote              =   "notificationGifRemoteId"
    case audioLocal             =   "notificationAudioLocalId"
    //case audioRemote            =   "notificationAudioRemoteId"
    case videoLocal             =   "notificationVideoLocalId"
    //case videoRemote            =   "notificationVideoRemoteId"
    case customContent          =   "notificationCustomContentId"
    case animatedcustomContent  =   "notificationAnimatedcustomContentId"
    
    
//    case serviceExtension = "notificationServiceExtensionId"
//    case contentExtension = "notificationContentExtensionId"
//    case animatedContentExtension = "animatedNotificationContentExtensionId"
    // last enum for count
     static var count: Int { return NotificationType.animatedcustomContent.hashValue + 1 }
}

enum ActionType: String {
    case like = "actionLikeId"
    case reply = "actionReplyId"
    
}
