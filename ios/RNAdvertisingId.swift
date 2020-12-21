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
        if #available(iOS 14, *) {
            getAdvertisingId_ios_14(){ response in
                resolve(response)
            }
        } else {
            // Fallback on earlier versions
            getAdvertisingId_ios_old(){ response in
                resolve(response)
            }
        }
    }
    
    func getAdvertisingId_ios_old(_ resolve: @escaping (_ response: NSMutableDictionary) -> Void) {
        let isAdvertisingTrackingEnabled : Bool = ASIdentifierManager.shared().isAdvertisingTrackingEnabled
        
        let response: NSMutableDictionary = [
            "isLimitAdTrackingEnabled" : !isAdvertisingTrackingEnabled,
            "advertisingId" : "",
            "status": "N/A", // App Tracking Transparency status: N/A if ios <= 13
        ]
        
        if (isAdvertisingTrackingEnabled) {
            let idfa : String = ASIdentifierManager.shared().advertisingIdentifier.uuidString
            response["advertisingId"] = idfa
        }
        
        resolve(response)
    }
    
    func getAdvertisingId_ios_14(_ resolve: @escaping (_ response: NSMutableDictionary) -> Void) {
        //use the image that was just retrieved
        let response: NSMutableDictionary = [
            "isLimitAdTrackingEnabled" : true,
            "advertisingId" : "",
            "status": "", // App Tracking Transparency status: N/A if ios <= 13
        ]
        
        if #available(iOS 14, *) {
            switch ATTrackingManager.trackingAuthorizationStatus {
            case .restricted:
                response["status"] = "restricted"
                resolve(response)
            case .denied:
                response["status"] = "denied"
                resolve(response)
            case .authorized:
                response["status"] = "authorized"
                response["isLimitAdTrackingEnabled"] = false
                response["advertisingId"] = ASIdentifierManager.shared().advertisingIdentifier.uuidString
                resolve(response)
            case .notDetermined:
                ATTrackingManager.requestTrackingAuthorization { status in
                    if (status == .authorized) {
                        response["status"] = "authorized"
                        response["isLimitAdTrackingEnabled"] = false
                        response["advertisingId"] = ASIdentifierManager.shared().advertisingIdentifier.uuidString
                    }
                    else {
                        response["status"] = "denied"
                    }
                    
                    resolve(response)
                }
            @unknown default:
                fatalError("Unhandled case: ATTrackingManager.trackingAuthorizationStatus have unhandled case")
            }
        } else {
            fatalError("getAdvertisingId_ios_14 should not be trigger on older ios")
        }
    }
}
