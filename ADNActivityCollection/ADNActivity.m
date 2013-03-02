//
//  ADNActivity.m
//  ADNActivityCollection
//
//  Created by Brennan Stehling on 3/2/13.
//  Copyright (c) 2013 SmallSharptools LLC. All rights reserved.
//

#import "ADNActivity.h"

#import "UIImage+BBlock.h"

@implementation ADNActivity

#pragma mark - Override Methods
#pragma mark -

// default returns nil. subclass may override to return custom activity type that is reported to completion handler
- (NSString *)activityType {
    // TODO implement
    return nil;
}

// default returns nil. subclass must override and must return non-nil value
- (NSString *)activityTitle {
    // TODO implement
    return nil;
}

// default returns nil. subclass must override and must return non-nil value
- (UIImage *)activityImage {
    // create an image (drawn using PaintCode) for a generic sharing image
    UIImage *image = [UIImage imageWithIdentifier:@"GenericShareActivityImage" forSize:CGSizeMake(43, 43) andDrawingBlock:^{
        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(33.75, 29.5)];
        [bezierPath addCurveToPoint: CGPointMake(31.07, 30.53) controlPoint1: CGPointMake(32.72, 29.5) controlPoint2: CGPointMake(31.81, 29.92)];
        [bezierPath addLineToPoint: CGPointMake(24.59, 25.9)];
        [bezierPath addCurveToPoint: CGPointMake(25.25, 23.12) controlPoint1: CGPointMake(25, 25.05) controlPoint2: CGPointMake(25.25, 24.12)];
        [bezierPath addCurveToPoint: CGPointMake(24.06, 19.44) controlPoint1: CGPointMake(25.25, 21.75) controlPoint2: CGPointMake(24.8, 20.48)];
        [bezierPath addLineToPoint: CGPointMake(31.64, 11.86)];
        [bezierPath addCurveToPoint: CGPointMake(33.75, 12.5) controlPoint1: CGPointMake(32.27, 12.23) controlPoint2: CGPointMake(32.97, 12.5)];
        [bezierPath addCurveToPoint: CGPointMake(38, 8.25) controlPoint1: CGPointMake(36.1, 12.5) controlPoint2: CGPointMake(38, 10.6)];
        [bezierPath addCurveToPoint: CGPointMake(33.75, 4) controlPoint1: CGPointMake(38, 5.9) controlPoint2: CGPointMake(36.1, 4)];
        [bezierPath addCurveToPoint: CGPointMake(29.5, 8.25) controlPoint1: CGPointMake(31.4, 4) controlPoint2: CGPointMake(29.5, 5.9)];
        [bezierPath addCurveToPoint: CGPointMake(30.14, 10.36) controlPoint1: CGPointMake(29.5, 9.03) controlPoint2: CGPointMake(29.77, 9.73)];
        [bezierPath addLineToPoint: CGPointMake(22.56, 17.94)];
        [bezierPath addCurveToPoint: CGPointMake(18.88, 16.75) controlPoint1: CGPointMake(21.51, 17.19) controlPoint2: CGPointMake(20.25, 16.75)];
        [bezierPath addCurveToPoint: CGPointMake(13.28, 20.14) controlPoint1: CGPointMake(16.44, 16.75) controlPoint2: CGPointMake(14.35, 18.13)];
        [bezierPath addLineToPoint: CGPointMake(8.16, 18.43)];
        [bezierPath addCurveToPoint: CGPointMake(6.12, 16.75) controlPoint1: CGPointMake(7.95, 17.48) controlPoint2: CGPointMake(7.14, 16.75)];
        [bezierPath addCurveToPoint: CGPointMake(4, 18.88) controlPoint1: CGPointMake(4.95, 16.75) controlPoint2: CGPointMake(4, 17.7)];
        [bezierPath addCurveToPoint: CGPointMake(6.12, 21) controlPoint1: CGPointMake(4, 20.05) controlPoint2: CGPointMake(4.95, 21)];
        [bezierPath addCurveToPoint: CGPointMake(7.51, 20.46) controlPoint1: CGPointMake(6.66, 21) controlPoint2: CGPointMake(7.14, 20.78)];
        [bezierPath addLineToPoint: CGPointMake(12.6, 22.15)];
        [bezierPath addCurveToPoint: CGPointMake(12.5, 23.12) controlPoint1: CGPointMake(12.55, 22.47) controlPoint2: CGPointMake(12.5, 22.79)];
        [bezierPath addCurveToPoint: CGPointMake(18.88, 29.5) controlPoint1: CGPointMake(12.5, 26.64) controlPoint2: CGPointMake(15.36, 29.5)];
        [bezierPath addCurveToPoint: CGPointMake(23.37, 27.64) controlPoint1: CGPointMake(20.63, 29.5) controlPoint2: CGPointMake(22.22, 28.79)];
        [bezierPath addLineToPoint: CGPointMake(29.8, 32.24)];
        [bezierPath addCurveToPoint: CGPointMake(29.5, 33.75) controlPoint1: CGPointMake(29.62, 32.71) controlPoint2: CGPointMake(29.5, 33.21)];
        [bezierPath addCurveToPoint: CGPointMake(33.75, 38) controlPoint1: CGPointMake(29.5, 36.09) controlPoint2: CGPointMake(31.4, 38)];
        [bezierPath addCurveToPoint: CGPointMake(38, 33.75) controlPoint1: CGPointMake(36.1, 38) controlPoint2: CGPointMake(38, 36.09)];
        [bezierPath addCurveToPoint: CGPointMake(33.75, 29.5) controlPoint1: CGPointMake(38, 31.41) controlPoint2: CGPointMake(36.1, 29.5)];
        [bezierPath closePath];
        bezierPath.miterLimit = 4;
        
        [[UIColor whiteColor] setFill];
        [bezierPath fill];
    }];
    
    return image;
}

// override this to return availability of activity based on items. default returns NO
- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems{
    return NO;
}

// override to extract items and set up your HI. default does nothing
- (void)prepareWithActivityItems:(NSArray *)activityItems {
    // TODO implement
}

// return non-nil to have vC presented modally. call activityDidFinish at end. default returns nil
- (UIViewController *)activityViewController {
    return nil;
}

// if no view controller, this method is called. call activityDidFinish when done. default calls [self activityDidFinish:NO]
- (void)performActivity {
    // TODO implement
}

// state method

// activity must call this when activity is finished. can be called on any thread
//- (void)activityDidFinish:(BOOL)completed

@end
