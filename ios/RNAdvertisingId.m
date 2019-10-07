//
//  RNAdvertisingId.m
//
//  Created by App Like on 28.09.17.
//

#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(RNAdvertisingId, NSObject)

RCT_EXTERN_METHOD(getAdvertisingId:(RCTPromiseResolveBlock)resolve rejecter: (RCTPromiseRejectBlock)reject)

+ (BOOL)requiresMainQueueSetup
{
  return NO;
}

@end
