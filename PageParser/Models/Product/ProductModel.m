//
//  ProductModel.m
//  PageParser
//
//  Created by Ozzy on 14.07.17.
//  Copyright © 2017 Empty. All rights reserved.
//

#import "ProductModel.h"

@implementation ProductModel


-(instancetype)initWithDictionary:(NSDictionary *)dictionary{
    
    self = [super initWithDictionary:dictionary];
    if (self) {
        [self setupWithDictionary:dictionary];
    }
    return self;
}

-(void)setupWithDictionary:(NSDictionary *)dictionary{
    
    
    
    
}

-(NSDictionary *)toDictionary{
    
    return @{};
}


@end
