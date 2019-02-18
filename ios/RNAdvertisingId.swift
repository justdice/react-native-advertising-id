//
//  RNAdvertisingId.swift
//
//  Created by App Like on 28.09.17.
//

import AdSupport
//import Foundation

@objc(RNAdvertisingId)
class RNAdvertisingId: NSObject {
    
//    @objc(getAdvertisingId:)
//    func getAdvertisingId(callback: RCTResponseSenderBlock) -> Void {
//
//        let isAdvertisingTrackingEnabled : Bool = ASIdentifierManager.shared().isAdvertisingTrackingEnabled
//
//        let response: NSMutableDictionary = [
//            "isLimitAdTrackingEnabled" : "limit tracking?",
//            "advertisingId" : "dsa1234"
//        ]
//
//        if isAdvertisingTrackingEnabled {
//            let idfa : String = ASIdentifierManager.shared().advertisingIdentifier.uuidString
//            response["advertisingId"] = idfa
//        }
//        callback([NSNull(), response])
//    }
//    @objc(getAdvertisingId:)
//    static func getAdvertisingId(callback: RCTResponseSenderBlock) -> String {
//
//                let isAdvertisingTrackingEnabled : Bool = ASIdentifierManager.shared().isAdvertisingTrackingEnabled
//
//        let response: NSMutableDictionary = [
//            "isLimitAdTrackingEnabled" : "limit tracking?",
//            "advertisingId" : "dsa1234"
//        ]
//
//                if isAdvertisingTrackingEnabled {
//                    let idfa : String = ASIdentifierManager.shared().advertisingIdentifier.uuidString
//                    response["advertisingId"] = idfa
//                }
//        return "Hello2"
//    }
    
    @objc
    func getAdvertisingId(_ resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) {
        let isAdvertisingTrackingEnabled : Bool = ASIdentifierManager.shared().isAdvertisingTrackingEnabled
        
        let response: NSMutableDictionary = [
            "isLimitAdTrackingEnabled" : isAdvertisingTrackingEnabled,
            "advertisingId" : ""
        ]
        
        if (isAdvertisingTrackingEnabled) {
            let idfa : String = ASIdentifierManager.shared().advertisingIdentifier.uuidString
            response["advertisingId"] = idfa
        }
        
        resolve(response)
    }

}
