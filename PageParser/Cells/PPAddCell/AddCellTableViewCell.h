//
//  AddCellTableViewCell.h
//  PageParser
//
//  Created by Ozzy on 27.07.17.
//  Copyright © 2017 Empty. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddCellDelegate;

@interface AddCellTableViewCell : UITableViewCell

@end



@protocol AddCellDelegate <NSObject>

- (void) addCellDidTap;

@end
