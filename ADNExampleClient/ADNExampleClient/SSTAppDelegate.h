//
//  SSTAppDelegate.h
//  ADNExampleClient
//
//  Created by Brennan Stehling on 3/10/13.
//  Copyright (c) 2013 SmallSharptools LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kPostProvidedByCallerNotification       @"PostProvidedByCallerNotification"

@interface SSTAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly) NSString *postText;
@property (readonly) NSURL *returnURL;

- (void)returnToCaller;

@end
