//
//  SSTViewController.m
//  ADNActivityCollection
//
//  Created by Brennan Stehling on 3/2/13.
//  Copyright (c) 2013 SmallSharptools LLC. All rights reserved.
//

#import "SSTViewController.h"

#import "ADNActivityCollection.h"
#import "ADNExampleActivity.h"

@interface SSTViewController () <UITextFieldDelegate>

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

- (IBAction)resetButtonTapped:(id)sender {
    self.contentTextView.text = @"";
    self.urlTextField.text = @"";
}

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
    if (![self hasContent] && ![self hasURL]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"No Content"
                                                        message: @"Please enter a message or a URL before sharing."
                                                       delegate: nil
                                              cancelButtonTitle: NSLocalizedString( @"OK", @"" )
                                              otherButtonTitles: nil];
        
        [alert show];
        return;
    }

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
        // reduntant catch all
        activityItems = @[];
    }
    
    NSArray *allActivities = [ADNActivityCollection allActivities];
    ADNExampleActivity *exampleActivity = [[ADNExampleActivity alloc] init];
    
    NSMutableArray *activities = [NSMutableArray array];
    [activities addObject:exampleActivity];
    [activities addObjectsFromArray:allActivities];
    
    UIActivityViewController *activityView = [[UIActivityViewController alloc] initWithActivityItems:activityItems
                                                                               applicationActivities:activities];
    
    // Exclude default activity types for demo.
    activityView.excludedActivityTypes = @[
            UIActivityTypePostToWeibo,
            UIActivityTypeMail,
            UIActivityTypeMessage,
            UIActivityTypePrint,
            UIActivityTypeSaveToCameraRoll
        ];
    
    [self presentViewController:activityView animated:YES completion:nil];
}

#pragma mark - UITextFieldDelegate
#pragma mark -

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([textField isEqual:self.urlTextField]) {
        [self shareContent];
    }
    
    return TRUE;
}

@end
