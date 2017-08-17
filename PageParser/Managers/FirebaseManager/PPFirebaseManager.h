//
//  PPFirebaseManager.h
//  PageParser
//
//  Created by Ozzy on 27.07.17.
//  Copyright © 2017 Empty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PPArbitraryModel.h"

@interface PPFirebaseManager : NSObject

+ (PPFirebaseManager*)sharedInstance;

- (void)saveProduct:(PPArbitraryModel*) arbModel withCompletion:(void(^)(NSError *error)) completion;

@end
