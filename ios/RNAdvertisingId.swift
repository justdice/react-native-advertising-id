//
//  RNAdvertisingId.swift
//
//  Created by App Like on 28.09.17.
//

import AdSupport
//import Foundation

@objc(RNAdvertisingId)
class RNAdvertisingId: NSObject {
    @objc
    func getAdvertisingId(_ resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) {
        let isAdvertisingTrackingEnabled : Bool = ASIdentifierManager.shared().isAdvertisingTrackingEnabled
        
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
}
