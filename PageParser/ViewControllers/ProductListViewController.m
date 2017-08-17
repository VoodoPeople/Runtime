//
//  ProductListViewController.m
//  PageParser
//
//  Created by Ozzy on 14.07.17.
//  Copyright © 2017 Empty. All rights reserved.
//

#import "ProductListViewController.h"
#import "PPDataFetcher.h"
#import "PPArbitraryModel.h"
#import "PPFirebaseManager.h"
#import "PPProductListCell.h"

@interface ProductListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray<PPArbitraryModel*> *products;
@end

@implementation ProductListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [[PPFirebaseManager sharedInstance] getAllProductsWithCompletion:^(NSArray *array, NSError *error) {
        self.products = array;
        [self.tableView reloadData];
    }];
    
}

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.products.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PPProductListCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([PPProductListCell class])];
    cell.productNameLabel.text = NSStringFromClass([self.products[indexPath.row] class]);
    return cell;
}

#pragma mark - UITableViewDelegate



@end
