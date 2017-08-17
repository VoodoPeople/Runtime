//
//  InputTableViewCell.h
//  PageParser
//
//  Created by Ozzy on 27.07.17.
//  Copyright © 2017 Empty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PPArbitraryModel.h"
@protocol InputCellDelegate;

@interface InputTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextField *keyTextField;
@property (weak, nonatomic) IBOutlet UITextField *valueTextField;


@property (weak, nonatomic) id<InputCellDelegate> delegate;

- (void)setupWithPropertyItem:(NSDictionary*) item;

@end

@protocol InputCellDelegate <NSObject>

- (void)keyFieldDidChanged:(NSString*) key;
- (void)valueFieldDidChanged:(NSString*) value;

@end
