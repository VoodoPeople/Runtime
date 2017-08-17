//
//  AddCellTableViewCell.m
//  PageParser
//
//  Created by Ozzy on 27.07.17.
//  Copyright © 2017 Empty. All rights reserved.
//

#import "AddCellTableViewCell.h"

@implementation AddCellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

-(void)setSelected:(BOOL)selected animated:(BOOL)animated{
    [super setSelected:selected animated:NO];
}

-(void)setSelectionStyle:(UITableViewCellSelectionStyle)selectionStyle{
    [super setSelectionStyle:UITableViewCellSelectionStyleNone];
}


@end
