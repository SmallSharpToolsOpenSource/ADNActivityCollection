//
//  SSTURLHelper.h
//  ADNExampleClient
//
//  Created by Brennan Stehling on 3/10/13.
//  Copyright (c) 2013 SmallSharptools LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SSTURLHelper : NSObject

+ (NSDictionary *)parseQueryString:(NSString *)queryString;
+ (NSString *)urlEncodeString:(NSString *)decodedUrl;
+ (NSString *)urlDecodeString:(NSString *)encodedUrl;

@end
