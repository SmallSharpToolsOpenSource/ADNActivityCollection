//
//  SSTAppDelegate.m
//  ADNActivityCollection
//
//  Created by Brennan Stehling on 3/2/13.
//  Copyright (c) 2013 SmallSharptools LLC. All rights reserved.
//

#import "SSTAppDelegate.h"

@implementation SSTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    DebugLog(@"%@", NSStringFromSelector(_cmd));
    DebugLog(@"openURL: %@", url);
    DebugLog(@"sourceApplication: %@", sourceApplication);
    DebugLog(@"annotation: %@", annotation);
    
    NSString *URLString = [url absoluteString];
    
    if (!URLString) {
        // The URL's absoluteString is nil. There's nothing more to do.
        return NO;
    }
    
    // Your application is defining the new URL type, so you should know the maximum character
    // count of the URL. Anything longer than what you expect is likely to be dangerous.
    NSInteger maximumExpectedLength = 2048;
    
    if ([URLString length] > maximumExpectedLength) {
        // The URL is longer than we expect. Stop servicing it.
        return NO;
    }

    // detect the return from an ADN client
    if ([sourceApplication isEqualToString:@"com.smallsharptools.ADNExampleClient"]) {
        DebugLog(@"And we're back!");
        // Do anything you'd like after returning from the ADN client
    }
    
    return YES;
}

@end
