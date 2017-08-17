//
//  ConfigureProductViewController.m
//  PageParser
//
//  Created by Ozzy on 27.07.17.
//  Copyright © 2017 Empty. All rights reserved.
//

#import "ConfigureProductViewController.h"
#import "AddCellTableViewCell.h"
#import "InputTableViewCell.h"
#import "PPFirebaseManager.h"

#import "PPArbitraryModel.h"

#import <objc/runtime.h>
@interface ConfigureProductViewController () <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (assign, nonatomic) NSInteger numberOfRows;

@property (weak, nonatomic) IBOutlet UITextField *productName;

@property (strong, nonatomic) PPArbitraryModel *arbitraryModel;

@end

@implementation ConfigureProductViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.numberOfRows = 1;
//    self.arbitraryModel = [[[self inheritClass:[PPArbitraryModel class] subclass:self.productName.text] alloc] init];
    
}


- (Class) inheritClass:(id) class subclass:(NSString*) subclass{
    
    Class newClass = objc_allocateClassPair([class class], [subclass UTF8String], 0);
    objc_registerClassPair(newClass);
    
    return newClass;
}

#pragma mark - Private

#pragma mark - Actions

- (IBAction)closeAction:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveAction:(id)sender {
    
    self.arbitraryModel.productName = self.productName.text;
    
    [[PPFirebaseManager sharedInstance] saveProduct:self.arbitraryModel withCompletion:^(NSError *error) {
        if (!error) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }        
    }];
    
}

#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _numberOfRows;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.row + 1 == _numberOfRows) {
        UITableViewCell *cell = (AddCellTableViewCell*) [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([AddCellTableViewCell class])];
        
        return cell;
    } else {
        
        NSArray *propertiesArray = [self.arbitraryModel propertiesArray];
        
        if (((int)indexPath.row) >= (int)(propertiesArray.count) || indexPath.row == 1) {
            return (InputTableViewCell*) [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([InputTableViewCell class])];
        }
        
        InputTableViewCell *cell = (InputTableViewCell*) [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([InputTableViewCell class])];
        [cell setupWithPropertyItem:propertiesArray[indexPath.row]];
        cell.delegate = self;
        return cell;
    }
}

#pragma mark - UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row + 1 == _numberOfRows) { 
        if (_numberOfRows > 1) {
            if (self.arbitraryModel == nil) {
                self.arbitraryModel = [[[self inheritClass:[PPArbitraryModel class] subclass:self.productName.text] alloc] init];
            }
            NSIndexPath *previouseCellIndexpath = [NSIndexPath indexPathForRow:indexPath.row - 1 inSection:indexPath.section];
            InputTableViewCell *cell = [self.tableView cellForRowAtIndexPath:previouseCellIndexpath];
            if ([cell isMemberOfClass:[InputTableViewCell class]]) {
               
                NSString *key = cell.keyTextField.text;
                NSString *value = cell.valueTextField.text;
                
                [self.arbitraryModel addPropertyWithKey:key value:value];
            }
        }
       
        _numberOfRows += 1;
        NSIndexPath *LocalIndexPath = [NSIndexPath indexPathForRow:indexPath.row+1 inSection:indexPath.section];
        [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
        [tableView scrollToRowAtIndexPath:LocalIndexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 70;
}
@end
