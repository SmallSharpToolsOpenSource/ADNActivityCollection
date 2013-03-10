//
//  SSTViewController.m
//  ADNExampleClient
//
//  Created by Brennan Stehling on 3/10/13.
//  Copyright (c) 2013 SmallSharptools LLC. All rights reserved.
//

#import "SSTPostViewController.h"

#import "SSTAppDelegate.h"

@interface SSTPostViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;


@property (readonly) NSString *postText;
@property (readonly) NSURL *returnURL;
@property (readonly) SSTAppDelegate *appDelegate;

@end

@implementation SSTPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(handlePostProvidedByCallerNotification:)
                                                 name: kPostProvidedByCallerNotification
                                               object: nil];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    DebugLog(@"%@", NSStringFromSelector(_cmd));
    NSString *postText = self.postText;
    DebugLog(@"postText: %@", postText);
    if (postText != nil) {
        self.textView.text = postText;
    }
    
    self.statusLabel.text = @"";
}

- (void)handlePostProvidedByCallerNotification:(NSNotification *)notification {
    DebugLog(@"%@", NSStringFromSelector(_cmd));
    NSString *postText = self.postText;
    if (postText != nil) {
        self.textView.text = postText;
    }
}

- (IBAction)cancelButtonTapped:(id)sender {
    
    self.statusLabel.text = @"Canceling...";
    
    // after 3 seconds return to the other app
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2.0 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        if (self.returnURL != nil) {
            self.statusLabel.text = @"Returning to Caller";
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                [self.navigationController popToRootViewControllerAnimated:TRUE];
                [self.appDelegate returnToCaller];
            });
        }
        else {
            [self.navigationController popToRootViewControllerAnimated:TRUE];
        }
        self.textView.text = @"";
    });
}

- (IBAction)postButtonTapped:(id)sender {
    DebugLog(@"%@", NSStringFromSelector(_cmd));
    
    self.statusLabel.text = @"Simulated Posting...";
    
    // after 3 seconds return to the other app
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2.0 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        if (self.returnURL != nil) {
            self.statusLabel.text = @"Returning to Caller";
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                [self.navigationController popToRootViewControllerAnimated:TRUE];
                [self.appDelegate returnToCaller];
            });
        }
        else {
            [self.navigationController popToRootViewControllerAnimated:TRUE];
        }
        self.textView.text = @"";
    });
}

- (NSString *)postText {
    return self.appDelegate.postText;
}

- (NSURL *)returnURL {
    return self.appDelegate.returnURL;
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
