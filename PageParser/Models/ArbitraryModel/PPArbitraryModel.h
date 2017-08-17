//
//  PPArbitraryModel.h
//  PageParser
//
//  Created by Ozzy on 17.08.17.
//  Copyright © 2017 Empty. All rights reserved.
//

#import <Foundation/Foundation.h>






@interface PPArbitraryModel : NSObject

@property id productId;


- (void)addPropertyWithKey:(NSString*) key value:(NSString*) value;

- (NSArray*)propertiesArray;
- (NSDictionary*)propertiesDictionary;

- (void)productId:(id)object;
- (id)productId;

@end
