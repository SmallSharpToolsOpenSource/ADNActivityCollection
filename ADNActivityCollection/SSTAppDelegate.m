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
    
#ifndef NDEBUG
    NSString *urlScheme = nil;
    
    NSArray *urlTypes = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleURLTypes"];
    if (urlTypes.count > 0) {
        NSDictionary *urlType = [urlTypes objectAtIndex:0];
        NSArray *urlSchemes = [urlType objectForKey:@"CFBundleURLSchemes"];
        if (urlSchemes.count > 0) {
            urlScheme = [urlSchemes objectAtIndex:0];
            NSLog(@"URL Scheme: %@", urlScheme);
        }
    }
    
//    CFBundleURLTypes =     (
//                            {
//                                CFBundleURLName = "com.smallsharptools.ADNActivityCollection";
//                                CFBundleURLSchemes =             (
//                                                                  adnactivitycollection
//                                                                  );
//                            }
//                            );
#endif
    
    return YES;
}

@end
