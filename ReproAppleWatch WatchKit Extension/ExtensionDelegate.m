//
//  ExtensionDelegate.m
//  ReproAppleWatch WatchKit Extension
//
//  Created by Ronan JANVRESSE on 07/10/2015.
//  Copyright © 2015 Ronan JANVRESSE. All rights reserved.
//

#import "ExtensionDelegate.h"
#import <HealthKit/HealthKit.h>

@implementation ExtensionDelegate

- (void)applicationDidFinishLaunching {
    HKWorkoutSession* session = [[HKWorkoutSession alloc]initWithActivityType:HKWorkoutActivityTypeRunning locationType:HKWorkoutSessionLocationTypeUnknown];
    session.delegate = self;
    HKHealthStore* healstore = [[HKHealthStore alloc]init];
    if ([HKHealthStore isHealthDataAvailable]) {
        NSLog(@"TEST");
    };
    
   
    NSSet* readobject = [NSSet setWithObject:[HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeartRate]];
    [healstore requestAuthorizationToShareTypes:nil readTypes:readobject completion:^(BOOL success, NSError *error) {
        
        if(success == YES)
        {
            NSLog(@"Perm OK");
        }
        else
        {
            NSLog(@"%@",error);
        }
    }];
    HKObjectType* heartratetype = [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeartRate];
    
    /*HKQuery* prediction = [HKQuery predicateForSamplesWithStartDate:[NSDate date] endDate:nil options:HKQueryOptionNone];
    HKAnchoredObjectQuery* query = [[HKAnchoredObjectQuery alloc]initWithType:heartratetype predicate:prediction anchor:nil limit:5 resultsHandler:nil];*/
    
    //    query.updateHandler= ^void(HKObserverQuery* query,HKObserverQueryCompletionHandler* completion,NSError* error){};
    
}

-(void)workoutSession:(HKWorkoutSession *)workoutSession didFailWithError:(NSError *)error{
    
}

- (void)workoutSession:(HKWorkoutSession *)workoutSession didChangeToState:(HKWorkoutSessionState)toState fromState:(HKWorkoutSessionState)fromState date:(NSDate *)date{
    
}



- (void)applicationDidBecomeActive {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillResignActive {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, etc.
}

@end
