//
//  ADNExampleActivity.m
//  ADNActivityCollection
//
//  Created by Brennan Stehling on 3/10/13.
//  Copyright (c) 2013 SmallSharptools LLC. All rights reserved.
//

#import "ADNExampleActivity.h"

@implementation ADNExampleActivity

#pragma mark - Public Implementation
#pragma mark -

- (NSString *)clientURLScheme {
    return @"adnexampleclient://";
}

#pragma mark - UIActivity Override Methods
#pragma mark -

- (NSString *)activityTitle {
    return @"Example";
}

- (NSURL *)clientOpenURL {
    if (self.clientURLScheme != nil) {
        NSString *urlString = [NSString stringWithFormat:@"%@post?text=%@", self.clientURLScheme, self.encodedText];
        NSString *appURLScheme = [self appURLScheme];
        if (appURLScheme != nil) {
            urlString = [NSString stringWithFormat:@"%@&returnURLScheme=%@", urlString, [self encodeText:appURLScheme]];
        }
#ifndef NDEBUG
        NSLog(@"clientOpenURL: %@", urlString);
#endif
        NSURL *openURL = [NSURL URLWithString:urlString];
        return openURL;
    }
    
    return nil;
}

- (void)performActivity {
#ifndef NDEBUG
    NSLog(@"Sharing: %@", self.encodedText);
#endif
    
    [self activityDidFinish:TRUE];
    [[UIApplication sharedApplication] openURL:self.clientOpenURL];
}

@end
