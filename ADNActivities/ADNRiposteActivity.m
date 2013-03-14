//
//  ADNRiposteActivity.m
//  ADNActivityCollection
//
//  Created by Brennan Stehling on 3/14/13.
//  Copyright (c) 2013 SmallSharptools LLC. All rights reserved.
//

#import "ADNRiposteActivity.h"

#import "UIImage+BBlock.h"

// Ripostedd docs for URL Scheme
// http://riposteapp.net/release-notes.html
// riposte://x-callback-url/createNewPost?text=blahblahblah&accountID=5952

@implementation ADNRiposteActivity

#pragma mark - Public Implementation
#pragma mark -

- (NSString *)clientURLScheme {
    return @"riposte://";
}

#pragma mark - UIActivity Override Methods
#pragma mark -

- (NSString *)activityTitle {
    return @"Riposte";
}

// Using default until one is defined
//- (UIImage *)activityImage {
//    // return image for Netbot
//    UIImage *image = [UIImage imageWithIdentifier:@"NetbotShareActivityImage" forSize:CGSizeMake(43, 43) andDrawingBlock:^{
//    }];
//    
//    return image;
//}

//
- (NSURL *)clientOpenURL {
    if (self.clientURLScheme != nil) {
        // Note: Adding another slash fixes the sharing option with Netbot
        // https://alpha.app.net/edmundtay/post/3828992
        NSString *urlString = [NSString stringWithFormat:@"%@x-callback-url/createNewPost?text=%@", self.clientURLScheme, self.encodedText];
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

@end
