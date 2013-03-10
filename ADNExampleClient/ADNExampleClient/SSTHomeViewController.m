//
//  SSTHomeViewController.m
//  ADNExampleClient
//
//  Created by Brennan Stehling on 3/10/13.
//  Copyright (c) 2013 SmallSharptools LLC. All rights reserved.
//

#import "SSTHomeViewController.h"

#import "SSTAppDelegate.h"

@interface SSTHomeViewController ()

@property (readonly) NSString *postText;
@property (readonly) SSTAppDelegate *appDelegate;

@end

@implementation SSTHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(handlePostProvidedByCallerNotification:)
                                                 name: kPostProvidedByCallerNotification
                                               object: nil];
}

- (void)handlePostProvidedByCallerNotification:(NSNotification *)notification {
    // skip to post view if the app delegate has a value defined to post (from URL Scheme)
    DebugLog(@"%@", NSStringFromSelector(_cmd));
    NSString *postText = self.postText;
    DebugLog(@"postText: %@", postText);
    if (postText != nil && ![@"" isEqualToString:postText]) {
        [self performSegueWithIdentifier:@"showPostView" sender:self];
    }
}

- (NSString *)postText {
    return self.appDelegate.postText;
}

- (SSTAppDelegate *)appDelegate {
    id<UIApplicationDelegate> delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate isKindOfClass:[SSTAppDelegate class]]) {
        SSTAppDelegate *appDelegate = (SSTAppDelegate *)delegate;
        return appDelegate;
    }
    
    return nil;
}

@end
