//
//  SSTAppDelegate.m
//  ADNExampleClient
//
//  Created by Brennan Stehling on 3/10/13.
//  Copyright (c) 2013 SmallSharptools LLC. All rights reserved.
//

#import "SSTAppDelegate.h"

#import "SSTURLHelper.h"

#pragma mark - Class Extension
#pragma mark -

@interface SSTAppDelegate ()

@property (strong, nonatomic) NSString *postText;
@property (strong, nonatomic) NSURL *returnURL;

@end

@implementation SSTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    DebugLog(@"%@", NSStringFromSelector(_cmd));
    
    // reset properties on regular launch
    self.postText = nil;
    self.returnURL = nil;
    
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
    
    // use the URLString to determine which section of the app should be displayed
    
    DebugLog(@"URLString: %@", URLString);
    
    if ([URLString hasPrefix:@"adnexampleclient://post"]) {
        // parse the parameters
        NSLog(@"url: %@", URLString);
        NSLog(@"url query: %@", [url query]);
        
        NSDictionary *parameters = [SSTURLHelper parseQueryString:[url query]];
        NSLog(@"parameters: %@", parameters);
        
        NSString *postText = [parameters objectForKey:@"text"];
        if (postText != nil) {
            DebugLog(@"text: %@", postText);
            self.postText = postText;
        }
        
        NSString *returnURLScheme = [parameters objectForKey:@"returnURLScheme"];
        if (returnURLScheme == nil) {
            returnURLScheme = @"";
        }

        NSURL *returnURL = [NSURL URLWithString:returnURLScheme];
        if ([[UIApplication sharedApplication] canOpenURL:returnURL]) {
            self.returnURL = returnURL;
        }
        
        [[NSNotificationCenter defaultCenter] postNotificationName:kPostProvidedByCallerNotification
                                                            object:nil];
    }
    else if ([URLString hasPrefix:@"fb"]) {
        // If it is the FB URL Scheme then handle it differently
    }
    
    return YES;
}

- (void)returnToCaller {
    if ([[UIApplication sharedApplication] canOpenURL:self.returnURL]) {
        [[UIApplication sharedApplication] openURL:self.returnURL];
    }

    // reset properties
    self.postText = nil;
    self.returnURL = nil;
}

@end
