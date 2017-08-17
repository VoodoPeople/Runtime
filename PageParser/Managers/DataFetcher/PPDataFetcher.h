//
//  PPDataFetcher.h
//  PageParser
//
//  Created by Ozzy on 14.07.17.
//  Copyright © 2017 Empty. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PPDataFetcher : NSObject


+(id) dataFetcherManager;


- (BOOL)downloadHtmlPageData;
- (void)parseProductItem;


@end
