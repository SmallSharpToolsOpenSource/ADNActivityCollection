//
//  SSTURLHelper.m
//  ADNExampleClient
//
//  Created by Brennan Stehling on 3/10/13.
//  Copyright (c) 2013 SmallSharptools LLC. All rights reserved.
//

#import "SSTURLHelper.h"

@implementation SSTURLHelper

+ (NSDictionary *)parseQueryString:(NSString *)queryString {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    NSArray * keyPairs = [queryString componentsSeparatedByString:@"&"];
    
    for (NSString *keyPair in keyPairs) {
        NSArray *values = [keyPair componentsSeparatedByString:@"="];
        if (values.count == 2) {
            NSString *key = [self urlDecodeString:values[0]];
            NSString *val = [self urlDecodeString:values[1]];
            dictionary[key] = val;
        }
    }
    
    return (NSDictionary *)dictionary;
}

+ (NSString *)urlEncodeString:(NSString *)decodedUrl {
    if (decodedUrl == nil) {
        return @"";
    }
    
    CFStringRef ref = CFURLCreateStringByAddingPercentEscapes( NULL,
                                                              (CFStringRef)decodedUrl,
                                                              NULL,
                                                              (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                              kCFStringEncodingUTF8 );
    
    NSString * encoded = [NSString stringWithString: (__bridge NSString *)ref];
    
    CFRelease( ref );
    
    return encoded;
}

+ (NSString *)urlDecodeString:(NSString *)encodedUrl {
    if (encodedUrl == nil) {
        return @"";
    }
    
    CFStringRef ref = CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault,
                                                                              (CFStringRef)encodedUrl,
                                                                              CFSTR(""),
                                                                              kCFStringEncodingUTF8);
	
    NSString *decoded = [NSString stringWithString: (__bridge NSString *)ref];
    
    CFRelease( ref );
    
	return decoded;
}

@end
