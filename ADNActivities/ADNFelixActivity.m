//
//  ADNFelixActivity.m
//  ADNActivityCollection
//
//  Created by Brennan Stehling on 3/2/13.
//  Copyright (c) 2013 SmallSharptools LLC. All rights reserved.
//

#import "ADNFelixActivity.h"

#import "UIImage+BBlock.h"

// http://tigerbears.com/felix/urls.html
// felix://
// felix://compose/post?text=[text] ("text" is optional, but is expected to be URL-encoded.)

@implementation ADNFelixActivity

#pragma mark - Public Implementation
#pragma mark -

- (NSString *)clientURLScheme {
    return @"felix://";
}

#pragma mark - UIActivity Override Methods
#pragma mark -

- (NSString *)activityTitle {
    return @"Felix";
}

- (UIImage *)activityImage {
    // return image for Felix
    UIImage *image = [UIImage imageWithIdentifier:@"FelixShareActivityImage" forSize:CGSizeMake(43, 43) andDrawingBlock:^{
        //// Color Declarations
        UIColor* fillColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
        
        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(38.5, 13.5)];
        [bezierPath addCurveToPoint: CGPointMake(34, 13) controlPoint1: CGPointMake(38.5, 13.5) controlPoint2: CGPointMake(40.01, 13.17)];
        [bezierPath addCurveToPoint: CGPointMake(22.5, 22.5) controlPoint1: CGPointMake(27.99, 12.83) controlPoint2: CGPointMake(22.5, 22.5)];
        [bezierPath addCurveToPoint: CGPointMake(12.5, 30.5) controlPoint1: CGPointMake(22.5, 22.5) controlPoint2: CGPointMake(18.6, 30.25)];
        [bezierPath addCurveToPoint: CGPointMake(4, 21) controlPoint1: CGPointMake(6.4, 30.75) controlPoint2: CGPointMake(4.17, 26.8)];
        [bezierPath addCurveToPoint: CGPointMake(12, 13) controlPoint1: CGPointMake(3.83, 15.2) controlPoint2: CGPointMake(6.85, 12.91)];
        [bezierPath addCurveToPoint: CGPointMake(22.5, 19.5) controlPoint1: CGPointMake(17.15, 13.09) controlPoint2: CGPointMake(22.5, 19.5)];
        [bezierPath addCurveToPoint: CGPointMake(34, 31) controlPoint1: CGPointMake(22.5, 19.5) controlPoint2: CGPointMake(28.99, 31.02)];
        [bezierPath addCurveToPoint: CGPointMake(38.5, 30.5) controlPoint1: CGPointMake(39.01, 30.98) controlPoint2: CGPointMake(38.5, 30.5)];
        [bezierPath addLineToPoint: CGPointMake(38.5, 30.5)];
        [fillColor setStroke];
        bezierPath.lineWidth = 2.5;
        [bezierPath stroke];
    }];
    
    return image;
}

- (NSURL *)clientOpenURL {
    if (self.clientURLScheme != nil) {
        NSString *urlString = [NSString stringWithFormat:@"%@compose/post?text=%@", self.clientURLScheme, self.encodedText];
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
