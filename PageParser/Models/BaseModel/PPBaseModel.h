//
//  PPBaseModel.h
//  PageParser
//
//  Created by Ozzy on 27.07.17.
//  Copyright © 2017 Empty. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PPBaseModel : NSObject


-(instancetype) initWithDictionary:(NSDictionary*) dictionary;
-(void) setupWithDictionary:(NSDictionary*) dictionary;

-(NSDictionary*) toDictionary;

@end
