//
//  ExtensionDelegate.h
//  ReproAppleWatch WatchKit Extension
//
//  Created by Ronan JANVRESSE on 07/10/2015.
//  Copyright © 2015 Ronan JANVRESSE. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <HealthKit/HealthKit.h>

@interface ExtensionDelegate : NSObject <WKExtensionDelegate,HKWorkoutSessionDelegate>

@end
