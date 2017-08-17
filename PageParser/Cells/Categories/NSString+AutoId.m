//
//  NSString+AutoId.m
//  PageParser
//
//  Created by Ozzy on 17.08.17.
//  Copyright © 2017 Empty. All rights reserved.
//

#import "NSString+AutoId.h"

@implementation NSString (AutoId)

NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

+ (NSString *)autoID:(NSInteger)len {
    
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    
    for (NSInteger i = 0; i < len; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform((int)[letters length])]];
    }
    
    return randomString;
}
@end
