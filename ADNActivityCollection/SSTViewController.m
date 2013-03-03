//
//  SSTViewController.m
//  ADNActivityCollection
//
//  Created by Brennan Stehling on 3/2/13.
//  Copyright (c) 2013 SmallSharptools LLC. All rights reserved.
//

#import "SSTViewController.h"

#import "ADNFelixActivity.h"
#import "ADNNetbotActivity.h"

@interface SSTViewController ()

@property (weak, nonatomic) IBOutlet UITextView *contentTextView;
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;

@end

@implementation SSTViewController

#pragma mark - View Lifecycle
#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.contentTextView becomeFirstResponder];
}

#pragma mark - User Actions
#pragma mark -

- (IBAction)shareButtonTapped:(id)sender {
    [self shareContent];
}

#pragma mark - Private
#pragma mark -

- (BOOL)hasContent {
    return self.contentTextView.text != nil && ![@"" isEqualToString:self.contentTextView.text];
}

- (BOOL)hasURL {
    return self.urlTextField.text != nil && ![@"" isEqualToString:self.urlTextField.text];
}

- (void)shareContent {
    NSArray *activityItems = nil;
    
    if ([self hasContent] && [self hasURL]) {
        activityItems = @[self.contentTextView.text, [NSURL URLWithString:self.urlTextField.text]];
    }
    else if ([self hasContent] && ![self hasURL]) {
        activityItems = @[self.contentTextView.text];
    }
    else if (![self hasContent] && [self hasURL]) {
        activityItems = @[[NSURL URLWithString:self.urlTextField.text]];
    }
    else {
        activityItems = @[];
    }
    
    ADNFelixActivity  *felixActivity = [[ADNFelixActivity alloc] init];
    ADNNetbotActivity *netbotActivity = [[ADNNetbotActivity alloc] init];
    
    NSArray *activities = @[felixActivity, netbotActivity];
    
    UIActivityViewController *activityView = [[UIActivityViewController alloc] initWithActivityItems:activityItems
                                                                               applicationActivities:activities];
    
    // Exclude default activity types for demo.
    activityView.excludedActivityTypes = @[
            UIActivityTypeAssignToContact,
            UIActivityTypePostToWeibo,
            UIActivityTypePrint,
            UIActivityTypeMail,
            UIActivityTypeMessage,
            UIActivityTypeSaveToCameraRoll
        ];
    
    [self presentViewController:activityView animated:YES completion:nil];
}

@end
