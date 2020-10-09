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
    func getAdvertisingId(_ resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) {
        isAppTrackingEnabled(requestPermission: true){(isAdvertisingTrackingEnabled: Bool) -> Void in
            //use the image that was just retrieved
            let response: NSMutableDictionary = [
                "isAppTrackingEnabled" : isAdvertisingTrackingEnabled,
                "advertisingId" : ""
            ]
            
            if (isAdvertisingTrackingEnabled) {
                let idfa : String = ASIdentifierManager.shared().advertisingIdentifier.uuidString
                response["advertisingId"] = idfa
            }
            
            resolve(response)
        }
        
        
    }

    //NEWLY ADDED PERMISSIONS FOR iOS 14
    func isAppTrackingEnabled(requestPermission: Bool = false, result: @escaping (_ isAuthorized: Bool) -> Void){
        if #available(iOS 14, *) {
            if(!requestPermission) {
                result(ATTrackingManager.trackingAuthorizationStatus == .authorized);
            }
            ATTrackingManager.requestTrackingAuthorization { status in
                if (status == .authorized){
                    result(true);
                }
                else {
                    result(false);
                }
            }
        }
        else {
            result(ASIdentifierManager.shared().isAdvertisingTrackingEnabled);
        }
    }
}
