//
//  RNAdvertisingId.swift
//
//  Created by App Like on 28.09.17.
//

import AdSupport
import AppTrackingTransparency
//import Foundation

@objc(RNAdvertisingId)
class RNAdvertisingId: NSObject {
    @objc
    func getAdvertisingId(_ requestPermission: Bool = false, resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) {
        let isAdvertisingTrackingEnabled : Bool = isAppTrackingEnabled(requestPermission);
        
        let response: NSMutableDictionary = [
            "isLimitAdTrackingEnabled" : !isAdvertisingTrackingEnabled,
            "advertisingId" : ""
        ]
        
        if (isAdvertisingTrackingEnabled) {
            let idfa : String = ASIdentifierManager.shared().advertisingIdentifier.uuidString
            response["advertisingId"] = idfa
        }
        
        resolve(response)
    }

    //NEWLY ADDED PERMISSIONS FOR iOS 14
    func isAppTrackingEnabled(requestPermission: Bool = false) -> Bool{
        if #available(iOS 14, *) {
            if(!requestPermission) {
                return (ATTrackingManager.trackingAuthorizationStatus == .authorized);
            }
            ATTrackingManager.requestTrackingAuthorization { status in
                return (status == .authorized);
            }
        }
        else {
            return ASIdentifierManager.shared().isAdvertisingTrackingEnabled;
        }
    }
}
