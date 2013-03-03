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
        [bezierPath moveToPoint: CGPointMake(39.5, 13.5)];
        [bezierPath addCurveToPoint: CGPointMake(34.5, 11.5) controlPoint1: CGPointMake(39.5, 13.5) controlPoint2: CGPointMake(37.6, 11.46)];
        [bezierPath addCurveToPoint: CGPointMake(22.5, 21.5) controlPoint1: CGPointMake(31.4, 11.54) controlPoint2: CGPointMake(22.5, 21.5)];
        [bezierPath addCurveToPoint: CGPointMake(12.5, 29.5) controlPoint1: CGPointMake(22.5, 21.5) controlPoint2: CGPointMake(18.6, 29.25)];
        [bezierPath addCurveToPoint: CGPointMake(5.5, 21.5) controlPoint1: CGPointMake(6.4, 29.75) controlPoint2: CGPointMake(5.74, 26.19)];
        [bezierPath addCurveToPoint: CGPointMake(12.5, 13.5) controlPoint1: CGPointMake(5.26, 16.81) controlPoint2: CGPointMake(8.29, 13.5)];
        [bezierPath addCurveToPoint: CGPointMake(21.5, 20.5) controlPoint1: CGPointMake(16.71, 13.5) controlPoint2: CGPointMake(21.5, 20.5)];
        [bezierPath addCurveToPoint: CGPointMake(32.5, 31.5) controlPoint1: CGPointMake(21.5, 20.5) controlPoint2: CGPointMake(28.26, 31.39)];
        [bezierPath addCurveToPoint: CGPointMake(39.5, 29.5) controlPoint1: CGPointMake(36.74, 31.61) controlPoint2: CGPointMake(39.5, 29.5)];
        [bezierPath addLineToPoint: CGPointMake(39.5, 29.5)];
        [fillColor setStroke];
        bezierPath.lineWidth = 2.5;
        [bezierPath stroke];
    }];
    
    return image;
}

- (NSURL *)clientOpenURL {
    if (self.clientURLScheme != nil) {
        NSString *urlString = [NSString stringWithFormat:@"%@compose/post?text=%@", self.clientURLScheme, self.encodedText];
        NSURL *openURL = [NSURL URLWithString:urlString];
        return openURL;
    }
    
    return nil;
}

@end
