//
//  ProductModel.h
//  PageParser
//
//  Created by Ozzy on 14.07.17.
//  Copyright © 2017 Empty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PPBaseModel.h"

@interface ProductModel : PPBaseModel


//The main product properties

@property (strong, nonatomic) NSString *productName;
@property (strong, nonatomic) NSString *productPrice;
@property (strong, nonatomic) NSString *productSource;
@property (strong, nonatomic) NSString *productIcon;
@property (strong, nonatomic) NSString *productDescription;
@property (strong, nonatomic) NSString *productDetailUrl;


@end
