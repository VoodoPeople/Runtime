//
//  ProductListViewController.m
//  PageParser
//
//  Created by Ozzy on 14.07.17.
//  Copyright © 2017 Empty. All rights reserved.
//

#import "ProductListViewController.h"
#import "PPDataFetcher.h"



@interface ProductListViewController ()





@property (weak, nonatomic) IBOutlet UIImageView *successImageView;

@end

@implementation ProductListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    BOOL result =  [[PPDataFetcher dataFetcherManager] downloadHtmlPageData];
    if (result) {
        self.successImageView.tintColor = [UIColor greenColor];
    }else{
        self.successImageView.tintColor = [UIColor redColor];
    }
    
    [[PPDataFetcher dataFetcherManager] parseProductItem];
    
}










@end
