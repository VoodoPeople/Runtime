//
//  PPArbitraryModel.h
//  PageParser
//
//  Created by Ozzy on 17.08.17.
//  Copyright © 2017 Empty. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PPArbitraryModel : NSObject

@property (strong, nonatomic) id productId;
@property (strong, nonatomic) id productName;

- (void)addPropertyWithKey:(NSString*) key value:(NSString*) value;

- (NSArray*)propertiesArray;
- (NSDictionary*)propertiesDictionary;
+ (Class)makeSubclass:(NSString*) subclass;
@end
