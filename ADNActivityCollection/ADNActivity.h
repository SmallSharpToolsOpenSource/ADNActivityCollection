//
//  ADNActivity.h
//  ADNActivityCollection
//
//  Created by Brennan Stehling on 3/2/13.
//  Copyright (c) 2013 SmallSharptools LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ADNActivity : UIActivity

@property (strong, nonatomic) NSString *text;
@property (readonly) NSString *encodedText;
@property (readonly) NSString *clientURLScheme;
@property (readonly) BOOL isClientInstalled;
@property (readonly) NSURL *clientOpenURL;

@end
